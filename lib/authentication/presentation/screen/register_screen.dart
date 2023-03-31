import 'package:flutter/material.dart';
import 'package:planta/authentication/presentation/widgets/navigate_to.dart';
import 'package:planta/core/constants/app_constant_string.dart';
import 'package:planta/layout/presentation/screens/home_screen.dart';

import '../widgets/login_register_component/register_form.dart';
import '../widgets/login_register_component/register_headers.dart';
import '../widgets/login_register_component/social_auth_button.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegisterHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SocialAuthButtons(
                      facebookAuth: () {},
                      googleAuth: () {
                        navigateTo(context: context, destination: HomeScreen());
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Text(
                        AppConstantString.loginBody,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    RegisterForm(
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      phoneController: phoneController,
                      formKey: GlobalKey<FormState>(),
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
