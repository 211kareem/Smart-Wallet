import 'dart:async';

import 'package:smartwallet/logic/viewmodel/category_details_view_model.dart';
import 'package:smartwallet/logic/viewmodel/category_view_model.dart';
import 'package:smartwallet/logic/viewmodel/dashboard_view_model.dart';
import 'package:smartwallet/models/category/category_details_response.dart';
import 'package:smartwallet/models/category/category_response.dart';
import 'package:smartwallet/models/dashboard/dashboard_response.dart';
import 'package:smartwallet/models/login/login_response.dart';
import 'package:smartwallet/services/abstract/api_service.dart';
import 'package:smartwallet/services/network_service_response.dart';
import 'package:smartwallet/utils/uidata.dart';

class MockService implements APIService {

  @override
  Future<NetworkServiceResponse<LoginResponse>> login(String phoneNumber, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
        responseCode: UIData.resCode200,
        response:  LoginResponse(
          empId: 010,
          empName: 'Kareem',
          empMobile: '0044752752752',
          message:  UIData.msgLoginSuccessfully,
        ),
        message: UIData.msgLoginSuccessfully));
  }

  @override
  Future<NetworkServiceResponse<List<DashBoardResponse>>> dashboard() {
    final dashboardVM = DashboardViewModel();
    return Future.value(NetworkServiceResponse(
        responseCode: UIData.resCode200,
        response: dashboardVM.getDashboard(),
        message: UIData.get_data));
  }

  @override
  Future<NetworkServiceResponse<List<CategoryResponse>>> category(num dashboardId) {
    final categoryVM = CategoryViewModel();
    List<CategoryResponse> categoryList = categoryVM.getCategory();
    return Future.value(NetworkServiceResponse(
        responseCode: UIData.resCode200,
        response: categoryList.where((category) => category.dashboardId == dashboardId).toList(),
        message: UIData.get_data));
  }

  @override
  Future<NetworkServiceResponse<List<CategoryDetailsResponse>>> categoryDetails(num categoryId) {
    final categoryDetailsVM = CategoryDetailsViewModel();
    List<CategoryDetailsResponse> categoryDetailsList = categoryDetailsVM.getCategoryDetails();
    return Future.value(NetworkServiceResponse(
        responseCode: UIData.resCode200,
        response: categoryDetailsList.where((categoryDetails) => categoryDetails.categoryId == categoryId).toList(),
        message: UIData.get_data));
  }
}

