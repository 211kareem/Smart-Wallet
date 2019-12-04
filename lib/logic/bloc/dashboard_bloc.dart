import 'dart:async';
import 'package:smartwallet/logic/blocprovider/bloc_provider.dart';
import 'package:smartwallet/logic/viewmodel/shop_view_model.dart';
import 'package:smartwallet/models/dashboard/dashboard_response.dart';
import 'package:smartwallet/models/fetch_process.dart';
import 'package:smartwallet/services/network_service_response.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc implements BlocBase{

  final dashboardListController = StreamController<shopViewModel>();
  Sink<shopViewModel> get dashboardListSink => dashboardListController.sink;
  final dashboardListBehaviorSubject = BehaviorSubject<FetchProcess>();
  Stream<FetchProcess> get dashboardListResult => dashboardListBehaviorSubject.stream;

  BehaviorSubject<String> _sortingController = BehaviorSubject<String>();
  Stream<String> get sortingName => _sortingController;

  List<DashBoardResponse> pickUpList;
  FetchProcess process;

  DashboardBloc() {
    dashboardListController.stream.listen(dashboardPickUpApi);
    listSorting('asc');
  }

  void dashboardPickUpApi(shopViewModel shopViewModel) async {
    final FetchProcess process = new FetchProcess(loadingStatus: 1); //loading
    dashboardListBehaviorSubject.add(process);

    await shopViewModel.getDashboard();
    process.type = ApiType.performDashboard;

    process.loadingStatus = 2;

    process.networkServiceResponse = shopViewModel.apiResult;
    process.statusCode = shopViewModel.apiResult.responseCode;

    pickUpList = process.networkServiceResponse.response;

    dashboardListBehaviorSubject.add(process);
    shopViewModel = null;
  }

  void listSorting(String sortingName)
  {
    _sortingController.sink.add(sortingName);
  }

  void dispose() {
    dashboardListController.close();
    dashboardListBehaviorSubject.close();
    _sortingController.close();
  }
}
