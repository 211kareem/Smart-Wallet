import 'dart:async';

import 'package:smartwallet/di/dependency_injection.dart';
import 'package:smartwallet/models/login/login_response.dart';
import 'package:smartwallet/services/abstract/api_service.dart';
import 'package:smartwallet/services/network_service_response.dart';
import 'package:meta/meta.dart';

class UserLoginViewModel {
  String userId, phoneNumber, password;
  NetworkServiceResponse apiResult;
  APIService apiService = new Injector().otpService;

  UserLoginViewModel.pickUp({@required this.userId});

  UserLoginViewModel.login({@required this.phoneNumber, @required this.password});

  Future<Null> getLogin(String phoneNumber, String password) async {
    NetworkServiceResponse<LoginResponse> result =
    await apiService.login(phoneNumber, password);
    this.apiResult = result;
  }
}
