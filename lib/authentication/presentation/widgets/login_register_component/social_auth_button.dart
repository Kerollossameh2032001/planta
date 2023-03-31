import 'package:flutter/material.dart';

import 'custom_social_button_style.dart';

class SocialAuthButtons extends StatelessWidget {
  final void Function()? googleAuth;
  final void Function()? facebookAuth;
  const SocialAuthButtons({
    Key? key, required this.googleAuth, required this.facebookAuth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialButton(
          socialMediaLogo:  const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/google_logo.png'),
              radius: 10,
            ),
          ),
          socialMediaName: "Google",
          onPressed: googleAuth,
          color: const Color.fromRGBO(244, 180, 0, 1),
        ),
      ],
    );
  }
}