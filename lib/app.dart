import 'package:flutter/material.dart';
import 'package:real_estate_app_new/Screens/splash_screen.dart';
import 'package:real_estate_app_new/Utils/app_colors.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(AppColor.primaryColor),
      ),
      home: const SplashScreen(),
    );
  }
}
