import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/authentication/presentation/controller/register_cubit/register_cubit.dart';
import '../../../core/constants/app_constant_string.dart';
import '../controller/register_cubit/register_state.dart';
import '../widgets/register_as_eng_component/register_eng_form.dart';
import '../widgets/register_as_eng_component/upload_image_profile.dart';

class RegisterAsAgricultureEngineer extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController nationalIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterEngCubit(),
      child: BlocConsumer<RegisterEngCubit, RegisterEngStates>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterEngCubit cubit = RegisterEngCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  UploadImageProfile(cubit: cubit),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 40.0.h, horizontal: 18.w),
                    child:
                        const Text(AppConstantString.registerAsAgriculturalEng),
                  ),
                  RegisterEngForm(
                    formKey: formKey,
                    nameController: nameController,
                    emailController: emailController,
                    phoneController: phoneController,
                    passwordController: passwordController,
                    cubit: cubit,
                    majorController: majorController,
                    nationalIDController: nationalIDController,
                    state: state,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


