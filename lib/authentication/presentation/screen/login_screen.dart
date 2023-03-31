import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:planta/authentication/presentation/widgets/navigate_to.dart';
import 'package:planta/layout/presentation/screens/home_screen.dart';

import '../../../core/constants/app_constant_string.dart';
import '../widgets/login_register_component/login_form.dart';
import '../widgets/login_register_component/login_header.dart';
import '../widgets/login_register_component/social_auth_button.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SocialAuthButtons(
                        facebookAuth: () {
                        },
                        googleAuth: () {
                          navigateTo(context: context, destination: HomeScreen());
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Text(
                        AppConstantString.loginBody,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    LoginForm(
                      emailController: emailController,
                      formKey: GlobalKey<FormState>(),
                      passwordController: passwordController,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
