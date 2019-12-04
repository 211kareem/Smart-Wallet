import 'package:flutter/material.dart';
import 'package:smartwallet/logic/bloc/dashboard_bloc.dart';
import 'package:smartwallet/logic/blocprovider/bloc_provider.dart';
import 'package:smartwallet/logic/viewmodel/shop_view_model.dart';
import 'package:smartwallet/models/dashboard/dashboard_response.dart';
import 'package:smartwallet/models/fetch_process.dart';
import 'package:smartwallet/services/network/api_subscription.dart';
import 'package:smartwallet/ui/pages/category/category_page.dart';
import 'package:smartwallet/ui/widgets/common_scaffold.dart';
import 'package:smartwallet/utils/translations.dart';
import 'package:smartwallet/utils/uidata.dart';

import 'dashboard_items.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardState createState() {
    return new DashboardState();
  }
}

class DashboardState extends State<DashboardPage> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  DashboardBloc dashboardBloc;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      actionFirstIcon: null,
      appTitle: Translations.of(context).text("app_name").toUpperCase(),
      showDrawer: true,
      scaffoldKey: _scaffoldState,
      bodyData: _bodyData(),
      showSorting: true,
    );
  }

  @override
  void initState() {
    super.initState();
    dashboardBloc = BlocProvider.of<DashboardBloc>(context);

    apiSubscription(dashboardBloc.dashboardListResult, this.context);
    dashboardBloc.dashboardListSink.add(shopViewModel.delivery());
    apiSubscription(dashboardBloc.dashboardListResult, this.context);
  }

  _bodyData() {
    return ListView(physics: BouncingScrollPhysics(), children: <Widget>[
      Column(children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          new StreamBuilder(
              stream: dashboardBloc.sortingName,
              builder: (context, snapshotSortingName) {
                return StreamBuilder<FetchProcess>(
                    stream: dashboardBloc.dashboardListResult,
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? snapshot.data.statusCode == UIData.resCode200
                              ? _bodyList(snapshotSortingName.data,
                                  snapshot.data.networkServiceResponse.response)
                              : Container()
                          : CircularProgressIndicator();
                    });
              }),
        ])
      ])
    ]);
  }

  _bodyList(String sortingName, List<DashBoardResponse> dashBoardResponseList) {
    sortingName == 'asc'
        ? dashBoardResponseList.sort((a, b) => a.title.compareTo(b.title))
        : dashBoardResponseList.sort((a, b) => b.title.compareTo(a.title));

    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: dashBoardResponseList.map((value) {
        return GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new CategoryPage(dashBoardResponse: value))),
            child: DashBoardItems(
              dashBoardResponse: value,
            ));
      }).toList(),
    );
  }
}
