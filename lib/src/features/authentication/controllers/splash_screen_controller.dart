// ignore_for_file: unused_element

import 'package:get/get.dart';

import '../screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController {

  static SplashScreenController get find => Get.find();

  Future _finishSplash() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Get.to(WelcomeScreen());
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
