import 'package:flutter/material.dart';
import 'package:planta/authentication/presentation/widgets/login_register_component/register_headers.dart';
import 'package:planta/authentication/presentation/widgets/login_register_component/social_auth_button.dart';
import 'package:planta/layout/presentation/screens/home_screen.dart';

import '../../../../core/constants/app_color_constant.dart';
import '../../../../core/constants/app_constant_string.dart';
import '../../../../core/global/components/custom_button.dart';
import '../../../../core/global/components/navigate_to.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const RegisterForm(
      {Key? key,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.passwordController,
      required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: nameController,
              cursorColor: AppColorConstant.appPrimaryColor,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: AppConstantString.nameHintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18, color: Colors.grey),
                alignLabelWithHint: true,
                labelText: AppConstantString.nameLabelText,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 20,color: Colors.grey),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Name can't be empty";
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                labelStyle: Theme.of(context).textTheme.bodyMedium,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: TextFormField(
              controller: phoneController,
              cursorColor: AppColorConstant.appPrimaryColor,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: AppConstantString.phoneHintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18, color: Colors.grey),
                alignLabelWithHint: true,
                labelText: AppConstantString.phoneLabelText,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 20,color: Colors.grey),
              validator: (value) {
                if (value!.isEmpty) {
                  return "phone can't be empty";
                } else if (!RegExp("^01[0125][0-9]{8}\$").hasMatch(value)) {
                  return "Phone isn't valid";
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: passwordController,
              autocorrect: true,
              cursorColor: AppColorConstant.appPrimaryColor,
              decoration: InputDecoration(
                  hintText: AppConstantString.passwordHintText,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18, color: Colors.grey),
                  alignLabelWithHint: true,
                  labelText: AppConstantString.passwordLabelText,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {},
                  )),
              keyboardType: TextInputType.text,
              obscureText: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 20,color: Colors.grey),              validator: (value) {
                if (value!.length < 6) {
                  return "Weak password";
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  navigateTo(context: context, destination: const HomeScreen());
                }
              },
              backgroundColor: AppColorConstant.appPrimaryColor,
              child: const Text(
                AppConstantString.registerHeader,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SocialAuthButtons(
            googleAuth: () {
              navigateTo(context: context, destination: const HomeScreen());
            },
          ),
          const ConfirmThePrivacy(),
          const NavigateToLogin()
        ],
      ),
    );
  }
}
