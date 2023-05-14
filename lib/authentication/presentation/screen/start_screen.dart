import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planta/core/global/components/navigate_and_replace.dart';

import '../../../core/constants/app_constant_assets_url.dart';
import '../../../core/constants/app_constant_string.dart';
import '../../../core/global/components/custom_button.dart';
import '../../../core/global/components/logo_layout.dart';
import '../../../core/global/components/navigate_to.dart';
import 'onboarding_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppConstantAssetsUrl.start),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            const SizedBox(
              height: 200,
              width: 150,
              child: LogoLayout(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              AppConstantString.startWelcomeMessage,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              AppConstantString.startDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () => navigateAndReplaceTo(
                  context: context,
                  destination: const OnBoardingScreen(),
                ),
                child: Text(
                  AppConstantString.getStartedButton,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
