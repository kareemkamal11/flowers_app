// ignore_for_file: use_build_context_synchronously

import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override

  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      SharedPreferences.getInstance().then((prefs) {
        final bool isOnboard = prefs.getBool('onboard') ?? false;
        if (isOnboard) {
          Navigator.of(context).pushReplacement(AppNavigator.homeScreen());
        } else {
          Navigator.of(context).pushReplacement(AppNavigator.onBoarding());
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsUtil.splashImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset(
          AssetsUtil.logoImage,
          width: 200,
          height: 200,
        ),
      )),
    );
  }
}

