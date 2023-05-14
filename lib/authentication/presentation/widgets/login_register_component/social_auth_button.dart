import 'package:flutter/material.dart';
import 'package:planta/core/constants/app_constant_assets_url.dart';

import 'custom_social_button_style.dart';

class SocialAuthButtons extends StatelessWidget {
  final void Function()? googleAuth;
  const SocialAuthButtons({
    Key? key, required this.googleAuth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: CustomSocialButton(
            socialMediaLogo:  const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(AppConstantAssetsUrl.googleIcon),
                radius: 10,
              ),
            ),
            socialMediaName: "Google",
            onPressed: googleAuth,
            color: const Color.fromRGBO(244, 180, 0, 1),
          ),
        ),
      ],
    );
  }
}