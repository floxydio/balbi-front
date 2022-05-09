import 'dart:async';
import 'package:balbinew/Pages/Auth/login_screen.dart';
import 'package:balbinew/Service/image_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    logger.i("Splash Screen");
    timer = Timer(const Duration(seconds: 3), () {
      checkLogin();
    });
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var getToken = prefs.getString("token");
    if (getToken != null) {
      Get.off(const HomeScreen());
    } else {
      Get.off(const LoginScreen());
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(ImageService().logo),
    ));
  }
}
