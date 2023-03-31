import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_constant_assets_url.dart';
import '../../../core/constants/app_constant_string.dart';
import '../widgets/custom_button.dart';
import '../widgets/logo_layout.dart';
import '../widgets/navigate_to.dart';
import 'login_screen.dart';
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
              height: 150,
              width: 150,
              child:  LogoLayout(),
            ),
            const SizedBox(height: 15),
            Text(
              AppConstantString.startWelcomeMessage,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              AppConstantString.startDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () => navigateTo(
                  context: context,
                  destination: OnBoardingScreen(),
                ),
                child: Text("Get Started",
                    style: Theme.of(context).textTheme.labelMedium),
              ),
            )
          ],
        ),
      ),
    );
  }
}
