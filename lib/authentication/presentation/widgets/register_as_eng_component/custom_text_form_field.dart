import 'package:flutter/material.dart';

import '../../../../core/constants/app_color_constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        cursorColor: AppColorConstant.appPrimaryColor,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 18, color: Colors.grey),
          alignLabelWithHint: true,
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          suffixIcon: suffixIcon,
        ),
        keyboardType: keyboardType,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 20, color: Colors.grey),
        validator: validator,
      ),
    );
  }
}