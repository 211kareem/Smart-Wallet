import 'dart:async';
import 'package:smartwallet/logic/viewmodel/shop_view_model.dart';
import 'package:smartwallet/models/fetch_process.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  final categoryListController = StreamController<shopViewModel>();
  Sink<shopViewModel> get categoryListSink => categoryListController.sink;
  final categoryListBehaviorSubject = BehaviorSubject<FetchProcess>();
  Stream<FetchProcess> get categoryListResult =>
      categoryListBehaviorSubject.stream;

  CategoryBloc() {
    categoryListController.stream.listen(categoryApi);
  }

  void categoryApi(shopViewModel shopViewModel) async {
    FetchProcess process = new FetchProcess(loadingStatus: 1); //loading
    categoryListBehaviorSubject.add(process);

    await shopViewModel.getCategory(shopViewModel.dashboardId);
    process.type = ApiType.performCategory;

    process.loadingStatus = 2;

    process.networkServiceResponse = shopViewModel.apiResult;
    process.statusCode = shopViewModel.apiResult.responseCode;

    categoryListBehaviorSubject.add(process);
    shopViewModel = null;
  }

  void dispose() {
    categoryListController.close();
    categoryListBehaviorSubject.close();
  }
}
