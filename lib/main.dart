import 'package:flowers/core/app_route.dart';
import 'package:flowers/core/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppStyles.mainColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppStyles.mainColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute.routerConfig,
    );
  }
}
