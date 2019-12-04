import 'dart:async';
import 'package:smartwallet/logic/viewmodel/shop_view_model.dart';
import 'package:smartwallet/models/fetch_process.dart';
import 'package:smartwallet/models/login/login_response.dart';
import 'package:smartwallet/utils/uidata.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc {
  final loginController = StreamController<shopViewModel>();

  Sink<shopViewModel> get loginSink => loginController.sink;
  final loginSubject = BehaviorSubject<FetchProcess>();

  Stream<FetchProcess> get apiResult => loginSubject.stream;

  LoginBloc() {
    loginController.stream.listen(apiCall);
  }

  void apiCall(shopViewModel shopViewModel) async {
    FetchProcess process = new FetchProcess(loadingStatus: 1); //loading
    loginSubject.add(process);

    await shopViewModel.getLogin(shopViewModel.phoneNumber, shopViewModel.password);
    process.type = ApiType.performLogin;

    process.loadingStatus = 2;
    process.networkServiceResponse = shopViewModel.apiResult;
    process.statusCode = shopViewModel.apiResult.responseCode;

    if (process.statusCode == UIData.resCode200) {
      LoginResponse loginResponse = process.networkServiceResponse.response;
      DateTime nowDateTime = DateTime.now();
      String patternDateTime = DateFormat('yyyy-MM-dd kk:mm a').format(nowDateTime);

      var sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('profile', "");

      sharedPreferences.setString('mobile', loginResponse.empMobile);
      sharedPreferences.setString('userName', loginResponse.empName);
      sharedPreferences.setInt('id', loginResponse.empId);
      sharedPreferences.setString('loginTime', patternDateTime);
    }

    loginSubject.add(process);
    shopViewModel = null;
  }

  void dispose() {
    loginController.close();
    loginSubject.close();
  }
}
