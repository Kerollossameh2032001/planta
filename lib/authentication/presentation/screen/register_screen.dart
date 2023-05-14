import 'package:flutter/material.dart';
import '../widgets/login_register_component/register_form.dart';
import '../widgets/login_register_component/register_headers.dart';

class RegisterAsFarmerScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterAsFarmerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const RegisterHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
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
