import 'package:flutter/material.dart';
import 'package:planta/core/constants/app_constant_string.dart';

import '../../../../core/constants/app_color_constant.dart';
import '../../screen/login_screen.dart';
import '../navigate_to.dart';


class RegisterHeader extends StatelessWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(AppConstantString.registerHeader,
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

class ConfirmThePrivacy extends StatelessWidget {
  const ConfirmThePrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        "By Signing up, you agreed with our terms of services and privacy policy",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
      ),
    );
  }
}

class NavigateToLogin extends StatelessWidget {
  const NavigateToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: Row(
        children: [
          Text(
            "Already have account? Log in",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 17),
          ),
          TextButton(
            onPressed: () {
              navigateTo(context: context, destination: LoginScreen());
            },
            child: Text(
              'Login',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColorConstant.appPrimaryColor,fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
