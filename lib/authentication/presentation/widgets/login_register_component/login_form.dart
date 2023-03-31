import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:planta/core/constants/app_constant_string.dart';
import 'package:planta/layout/presentation/screens/home_screen.dart';

import '../../../../core/constants/app_color_constant.dart';
import '../custom_button.dart';
import '../navigate_to.dart';


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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: TextFormField(
              controller: emailController,
              cursorColor: AppColorConstant.appPrimaryColor,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: AppConstantString.emailHintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey,fontSize: 15),
                alignLabelWithHint: true,
                labelText: AppConstantString.emailLabelText,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your E_mail";
                } else {
                  return null;
                }
              },
              style: Theme.of(context).textTheme.bodyMedium,
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
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey,fontSize: 15),
                  alignLabelWithHint: true,
                  labelText: AppConstantString.passwordLabelText,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {},
                  )),
              keyboardType: TextInputType.text,
              obscureText: true,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter the Password";
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 21.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    PageRouteBuilder(
                        transitionsBuilder: (context,animation,secondaryAnimation,child){
                          //timeDilation = 2.0;
                          return SharedAxisTransition(
                            transitionType: SharedAxisTransitionType.scaled,
                            secondaryAnimation: secondaryAnimation,
                            animation: animation,
                            fillColor: AppColorConstant.secondaryAppPrimaryDarkColor,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(seconds: 1,milliseconds: 500),
                        pageBuilder: (context,animation,secondaryAnimation) {
                          return ForgetPasswordScreen();
                        },
                    ),
                );
              },
              child: Text(
                'Forget Your Password',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  navigateTo(context: context, destination: HomeScreen());
                }
              },
              backgroundColor: AppColorConstant.appPrimaryColor,
              child: const Text("Login",style: TextStyle(fontSize: 25),),
            ),
          ),
        ],
      ),
    );
  }
}
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
