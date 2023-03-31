
import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:planta/authentication/presentation/screen/register_screen.dart';
import 'package:planta/core/constants/app_constant_colors.dart';

import '../../../core/constants/app_color_constant.dart';
import '../widgets/custom_button.dart';
import '../widgets/onboarding_components/build_page_item.dart';
import '../widgets/onboarding_components/indicator.dart';
import '../widgets/onboarding_components/onboaring_model.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

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
                onPageChanged: (int val) =>
                    setState(() {
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
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20.0, right: 20.0, bottom: 15.0),
              child: CustomButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionsBuilder: (context,animation,secondaryAnimation,child){
                        //timeDilation = 2;
                        return SharedAxisTransition(
                          transitionType: SharedAxisTransitionType.scaled,
                          secondaryAnimation: secondaryAnimation,
                          animation: animation,
                          fillColor: AppColorConstant.secondaryAppPrimaryDarkColor,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(seconds: 1,milliseconds: 500),
                      pageBuilder: (context,animation,secondaryAnimation) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: const Text('Login in'),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionsBuilder: (context,animation,secondaryAnimation,child){
                        //timeDilation = 2.0;
                        return SharedAxisTransition(
                          transitionType: SharedAxisTransitionType.scaled,
                          secondaryAnimation: secondaryAnimation,
                          animation: animation,
                          fillColor: AppColorConstant.secondaryAppPrimaryDarkColor,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(seconds: 1,milliseconds: 500),
                      pageBuilder: (context,animation,secondaryAnimation) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
                backgroundColor: AppColorConstant.secondaryAppPrimaryDarkColor,
                child: Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
