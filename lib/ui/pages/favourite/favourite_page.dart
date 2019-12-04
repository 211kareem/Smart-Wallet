import 'package:flutter/material.dart';
import 'package:smartwallet/logic/bloc/shopping_bloc.dart';
import 'package:smartwallet/logic/blocprovider/bloc_provider.dart';
import 'package:smartwallet/models/myorder/my_order_response.dart';
import 'package:smartwallet/ui/widgets/common_scaffold.dart';
import 'package:smartwallet/utils/translations.dart';

import 'favourite_items.dart';

class FavouritePage extends StatefulWidget {
  @override
   FavouriteWidgetState createState() {
    return new FavouriteWidgetState();
  }
}

class FavouriteWidgetState extends State<FavouritePage> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  ShoppingBloc _shoppingBloc;

  _bodyData() {
    return ListView(physics: BouncingScrollPhysics(), children: <Widget>[
      Column(children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          StreamBuilder(
              stream: _shoppingBloc.favoriteItems,
              builder: (context, AsyncSnapshot<List<MyOrder>> snapshot) {
                return snapshot.hasData
                    ? _bodyList(snapshot.data)
                    : Container();
              })
        ])
      ])
    ]);
  }

  _bodyList(List<MyOrder> myOrderList) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: myOrderList.map((value) {
        return FavouriteItems(myOrder: value);
      }).toList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _shoppingBloc = BlocProvider.of<ShoppingBloc>(context);

    return CommonScaffold(
      appTitle:
          Translations.of(context).text("drawer_favourite").toUpperCase(),
      showDrawer: false,
      scaffoldKey: _scaffoldState,
      bodyData: _bodyData(),
      showBottomNav: false,
    );
  }
}
