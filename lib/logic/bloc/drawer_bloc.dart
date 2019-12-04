import 'dart:async';
import 'package:smartwallet/models/drawer/drawer_response.dart';

class DrawerBloc {
  final userController = StreamController<DrawerResponse>();

  Stream<DrawerResponse> get user => userController.stream;

  DrawerBloc() {
    userData();
  }

  void userData() async {
    //var sharedPreferences = await SharedPreferences.getInstance();
    //String photoPath = sharedPreferences.getString("profile");

    userController.add(DrawerResponse(
      username: 'Kareem Khaled',
      email: 'kareemkhaled3350@gmail.com',
      photo: null,
    ));
  }
}
