import 'dart:async';

import 'package:smartwallet/di/dependency_injection.dart';
import 'package:smartwallet/models/category/category_details_response.dart';
import 'package:smartwallet/models/category/category_response.dart';
import 'package:smartwallet/models/dashboard/dashboard_response.dart';
import 'package:smartwallet/models/login/login_response.dart';
import 'package:smartwallet/services/abstract/api_service.dart';
import 'package:smartwallet/services/network_service_response.dart';
import 'package:meta/meta.dart';

class shopViewModel {
  int dashboardId, categoryId;
  String phoneNumber, password;

  NetworkServiceResponse apiResult;
  APIService apiService = new Injector().otpService;

  shopViewModel.delivery();

  shopViewModel.dashboard({this.dashboardId});
  shopViewModel.category({this.categoryId});
  shopViewModel.login({@required this.phoneNumber, @required this.password});

  Future<Null> getLogin(String phoneNumber, String password) async {
    NetworkServiceResponse<LoginResponse> result =
    await apiService.login(phoneNumber, password);
    this.apiResult = result;
  }

  Future<Null> getDashboard() async {
    NetworkServiceResponse<List<DashBoardResponse>> result =
    await apiService.dashboard();
    this.apiResult = result;
  }

  Future<Null> getCategory(num dashboardId) async {
    NetworkServiceResponse<List<CategoryResponse>> result =
    await apiService.category(dashboardId);
    this.apiResult = result;
  }

  Future<Null> getCategoryDetails(num categoryId) async {
    NetworkServiceResponse<List<CategoryDetailsResponse>> result =
    await apiService.categoryDetails(categoryId);
    this.apiResult = result;
  }
}
