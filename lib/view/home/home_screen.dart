import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/app_widget.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

import 'home_appbar_widget.dart';
import 'home_search_widget.dart';
import 'homepage_ad.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
          child: Column(
            children: [
              const HomeAppBarWidget(),
              const HomePageAd(),
              const HomeSearchWidget(),
              Row(
                children: [
                  Text(
                    'Discover by category',
                    style: AppStyles.robotoStyle.copyWith(
                      color: AppStyles.mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  AppWidget.seeall,
                  const SizedBox(width: 10),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 30);
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          width: 70,
                          height: 70,
                          decoration: const ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0xFFFBE7E4), Color(0x00FBE7E4)],
                            ),
                            shape: OvalBorder(),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
