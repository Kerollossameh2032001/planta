import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/core/constants/app_constant_string.dart';
import 'package:planta/core/global/components/navigate_and_replace.dart';
import 'package:planta/core/global/components/navigate_to.dart';
import 'package:planta/layout/presentation/screens/layout_screen.dart';

import '../../../../core/constants/app_color_constant.dart';
import '../../../../core/global/components/custom_button.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
            child: TextFormField(
              controller: emailController,
              cursorColor: AppColorConstant.appPrimaryColor,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: AppConstantString.emailHintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey, fontSize: 15.sp),
                alignLabelWithHint: true,
                labelText: AppConstantString.emailLabelText,
                                    labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your E_mail";
                } else {
                  return null;
                }
              },
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 20,color: Colors.grey),            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: TextFormField(
              controller: passwordController,
              autocorrect: true,
              cursorColor: AppColorConstant.appPrimaryColor,
              decoration: InputDecoration(
                hintText: AppConstantString.passwordHintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey, fontSize: 15.sp),
                alignLabelWithHint: true,
                labelText: AppConstantString.passwordLabelText,
                                    labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {},
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 20,color: Colors.grey),              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter the Password";
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(height: 30.w),
          Padding(
            padding: EdgeInsets.only(left: 21.0.w),
            child: TextButton(
              onPressed: () {
                navigateTo(
                    context: context, destination: ForgetPasswordScreen());
              },
              child: Text(
                AppConstantString.forgetPasswordHeader,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
            child: CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  navigateTo(context: context, destination: LayoutScreen());
                }
              },
              backgroundColor: AppColorConstant.appPrimaryColor,
              child: Text(
                AppConstantString.loginButton,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstantString.forgetPasswordHeader,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 25.h),
              Text(
                AppConstantString.forgetPasswordSubHeader,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 40.h),
              Form(
                key: formKey,
                child: TextFormField(
                  controller: emailController,
                  cursorColor: AppColorConstant.appPrimaryColor,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: AppConstantString.emailHintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, color: Colors.grey),
                    alignLabelWithHint: true,
                    labelText: AppConstantString.emailLabelText,
                    labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 20,color: Colors.grey),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "E_mail can't be empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 25.h),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    navigateAndReplaceTo(context: context, destination:  LayoutScreen());
                  }
                },
                backgroundColor: AppColorConstant.appPrimaryColor,
                child: Text(
                  AppConstantString.forgetPasswordButton,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
