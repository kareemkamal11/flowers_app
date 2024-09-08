import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/model/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/onboard_body.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentIndex < onboardData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(AppNavigator.homeScreen());
      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool('onboard', true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onboardData[currentIndex].backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onboardData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    late double topPadding;
                    if (onboardData[index].title == 'Milkshake') {
                      topPadding = 240;
                    } else {
                      topPadding = MediaQuery.of(context).size.height / 4;
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: topPadding),
                          child: OnBoardingItemWidget(
                            bodyImage: onboardData[index].bodyImage,
                            titleText: onboardData[index].title,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              ActionButtonWidget(
                onTap: nextPage,
                title: currentIndex == onboardData.length - 1
                    ? 'Get Started'
                    : 'Next',
              ),
              const SizedBox(height: 15),
              SmoothPageIndicator(
                controller: pageController,
                count: onboardData.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppStyles.mainColor,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ActionButtonWidget({
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 320,
        height: 50,
        decoration: ShapeDecoration(
          color: AppStyles.mainColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(60),
            ),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 1,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Text(title, style: AppStyles.robotoStyleWhite),
      ),
    );
  }
}
