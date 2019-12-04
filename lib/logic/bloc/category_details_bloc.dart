import 'dart:async';
import 'package:smartwallet/logic/viewmodel/shop_view_model.dart';
import 'package:smartwallet/models/fetch_process.dart';
import 'package:rxdart/rxdart.dart';

class CategoryDetailsBloc {
  final categoryDetailsController = StreamController<shopViewModel>();
  Sink<shopViewModel> get categoryDetailsSink => categoryDetailsController.sink;
  final  categoryDetailsBehaviorSubject = BehaviorSubject<FetchProcess>();
  Stream<FetchProcess> get  categoryDetailsResult =>
      categoryDetailsBehaviorSubject.stream;

  CategoryDetailsBloc() {
    categoryDetailsController.stream.listen(categoryApi);
  }

  void categoryApi(shopViewModel shopViewModel) async {
    FetchProcess process = new FetchProcess(loadingStatus: 1); //loading
    categoryDetailsBehaviorSubject.add(process);

    await shopViewModel.getCategoryDetails(shopViewModel.categoryId);
    process.type = ApiType.performCategory;

    process.loadingStatus = 2;

    process.networkServiceResponse = shopViewModel.apiResult;
    process.statusCode = shopViewModel.apiResult.responseCode;

    categoryDetailsBehaviorSubject.add(process);
    shopViewModel = null;
  }

  void dispose() {
    categoryDetailsController.close();
    categoryDetailsBehaviorSubject.close();
  }
}
