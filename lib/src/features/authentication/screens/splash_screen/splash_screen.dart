import 'package:adha_task/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../welcome/welcome_screen.dart';

class TSplashScreen extends StatefulWidget {
  const TSplashScreen({super.key});

  @override
  State<TSplashScreen> createState() => _TSplashScreenState();
}

class _TSplashScreenState extends State<TSplashScreen> {

  //final splashController = Get.put(SplashScreenController());

  @override
  void initState() {
    _finishSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(tSplashImagePath),
          width: 400,
        ),
      ),
    );
  }

  Future _finishSplash() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
