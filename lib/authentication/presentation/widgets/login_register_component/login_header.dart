import 'package:flutter/material.dart';
import 'package:planta/core/constants/app_constant_string.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
          AppConstantString.loginHeader,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 30),
      ),
    );
  }
}
