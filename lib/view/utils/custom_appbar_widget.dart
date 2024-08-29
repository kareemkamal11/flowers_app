import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flowers/core/navigation_app.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.customWidget,
    this.customBackButton, this.customIcon,
  });

  final String title;

  final Widget? customWidget;

  final IconData? customIcon;
  final Function()? customBackButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      customIcon ??
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                    onPressed: customBackButton ??
                        () {
                          Navigator.of(context)
                              .pushReplacement(AppNavigator.homeScreen());
                        },
                  ),
                  Text(title,
                      style: AppStyles.robotoStyle.copyWith(
                        fontSize: 25,
                      )),
                  Image.asset(AssetsUtil.vector, width: 30),
                ],
              ),
              const SizedBox(height: 15),
              customWidget ?? Container(),
            ],
          ),
        ),
        Container(
          color: AppStyles.secondaryColor,
          height: 2,
        ),
      ],
    );
  }
}
