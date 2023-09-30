import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Timer(Duration(seconds: 1), () {
      Get.offNamed('/login'); // Navigate to the login page after 1 second
    });
    return const Scaffold(
      body: Center(
        child: Image(image:AssetImage( "assets/images/Splash.png"))
      ),
    );
}



}

