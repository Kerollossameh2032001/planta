import 'dart:async';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/authentication/presentation/screen/privacy_screen.dart';
import 'package:planta/authentication/presentation/screen/register_as_farmer_screen.dart';
import 'package:planta/core/constants/app_constant_string.dart';
import 'package:planta/core/global/components/navigate_and_replace.dart';
import 'package:planta/core/global/components/navigate_to.dart';
import '../../../core/constants/app_color_constant.dart';
import '../../../core/global/components/custom_button.dart';
import '../widgets/onboarding_components/build_page_item.dart';
import '../widgets/onboarding_components/indicator.dart';
import '../widgets/onboarding_components/onboaring_model.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                allowImplicitScrolling: true,
                scrollDirection: Axis.horizontal,
                itemCount: pageData.length,
                onPageChanged: (int val) => setState(() {
                  currentIndex = val;
                }),
                itemBuilder: (context, index) {
                  return BuildPageItem(model: pageData[index]);
                },
                controller: pageController,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            Indicator(pageController: pageController),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.h, left: 40.0.w, right: 40.0.w, bottom: 15.0.h),
              child: CustomButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  navigateTo(context: context, destination: LoginScreen());
                },
                child: Text(
                  AppConstantString.loginHeader,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 40.0.w, right: 40.0.w, bottom: 20.0.h),
              child: CustomButton(
                onPressed: () {
                  navigateTo(
                      context: context, destination: const PrivacyScreen());
                },
                backgroundColor: AppColorConstant.secondaryAppPrimaryDarkColor,
                child: Text(
                  AppConstantString.registerHeader,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
