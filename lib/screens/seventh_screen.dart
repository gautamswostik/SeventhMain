import 'package:flutter/material.dart';
import 'package:seventh_main/screens/authenticatonscreen/login.dart';
import 'package:seventh_main/screens/home/home_screen.dart';
import 'package:seventh_main/util/screenutil/screenutil.dart';
import 'package:seventh_main/util/themes/app_colors.dart';

class SeventhApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seventh Main',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.unselectedTabColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: AppColors.royalBlue,
        ),
      ),
      // home: LoginScreen(),
      home: HomeScreen(),
    );
  }
}
