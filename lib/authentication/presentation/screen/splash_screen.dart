import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planta/authentication/presentation/screen/start_screen.dart';
import 'package:planta/core/global/components/navigate_and_replace.dart';
import 'package:planta/core/global/components/navigate_to.dart';
import '../../../core/constants/app_constant_assets_url.dart';
import '../../../core/constants/app_constant_string.dart';
import '../../../core/global/components/logo_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => navigateAndReplaceTo(destination: const StartScreen(),context: context),
    );
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
            image: AssetImage(AppConstantAssetsUrl.backgroundImage),
                fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoLayout(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppConstantString.appTitle, style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    AppConstantString.appSubTitle,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
