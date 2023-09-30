import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_project/View/screens/login_screen.dart';
import 'package:getx_sample_project/View/screens/splash_screen.dart';
import 'package:getx_sample_project/core/constants/theme_constants.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeConstants.lightTheme,
      darkTheme: ThemeConstants.darkTheme,
      themeMode: ThemeMode.light,

      initialRoute: '/login',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
      ],
    );
  }
}

