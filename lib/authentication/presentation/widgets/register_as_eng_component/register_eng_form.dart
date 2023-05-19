import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/authentication/presentation/widgets/register_as_eng_component/upload_personal_id_photo.dart';
import 'package:planta/authentication/presentation/widgets/register_as_eng_component/upload_resume.dart';

import '../../../../core/constants/app_color_constant.dart';
import '../../../../core/constants/app_constant_colors.dart';
import '../../../../core/constants/app_constant_string.dart';
import '../../../../core/global/components/custom_button.dart';
import '../../../../core/global/components/navigate_to.dart';
import '../../../../layout/presentation/screens/home_screen.dart';
import '../../controller/register_cubit/register_cubit.dart';
import '../../controller/register_cubit/register_state.dart';
import '../login_register_component/register_headers.dart';
import 'custom_text_form_field.dart';

class RegisterEngForm extends StatelessWidget {
  const RegisterEngForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.cubit,
    required this.majorController,
    required this.nationalIDController, required this.state,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final RegisterEngCubit cubit;
  final TextEditingController majorController;
  final TextEditingController nationalIDController;
  final RegisterEngStates state;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //name field
          CustomTextFormField(
            controller: nameController,
            hintText: AppConstantString.nameHintText,
            labelText: AppConstantString.nameLabelText,
            validator: (value) {
              if (value!.isEmpty) {
                return "Name can't be empty";
              } else {
                return null;
              }
            },
          ),
          //Email Field
          CustomTextFormField(
            controller: emailController,
            hintText: AppConstantString.emailHintText,
            labelText: AppConstantString.emailLabelText,
            validator: (value) {
              if (value!.isEmpty) {
                return "E_mail can't be empty";
              } else {
                return null;
              }
            },
          ),
          //Phone Field
          CustomTextFormField(
            controller: phoneController,
            hintText: AppConstantString.phoneHintText,
            labelText: AppConstantString.phoneLabelText,
            keyboardType: TextInputType.phone,
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
          //Password Field
          CustomTextFormField(
            controller: passwordController,
            hintText: AppConstantString.passwordHintText,
            labelText: AppConstantString.passwordLabelText,
            keyboardType: TextInputType.visiblePassword,
            obscureText: cubit.obscureText,
            suffixIcon: IconButton(
              onPressed: () {
                cubit.changeObscure();
              },
              icon: cubit.visibilityIcon,
              color: Theme.of(context).primaryColor,
            ),
            validator: (value) {
              if (value!.length < 6) {
                return "Weak password";
              } else {
                return null;
              }
            },
          ),

          CustomTextFormField(
            controller: majorController,
            hintText: AppConstantString.majorHintText,
            labelText: AppConstantString.majorLabelText,
            validator: (value) {
              if (value!.isEmpty) {
                return "The major is required";
              } else {
                return null;
              }
            },
          ),

          //National ID number
          CustomTextFormField(
            controller: nationalIDController,
            hintText: AppConstantString.nationalIDHintText,
            labelText: AppConstantString.nationalIDLabelText,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return "National ID is required";
              } else if (value.length < 14 || value.length > 14) {
                return "National ID isn't valid";
              } else {
                return null;
              }
            },
          ),

          //Personal ID Card Photo
          UploadPersonalIDPhoto(cubit: cubit, state: state),

          //Gender
          Container(
            margin: const EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppConstantColor.secondaryPrimaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Gender'),
                Row(
                  children: [
                    Radio(
                      activeColor: Theme.of(context).primaryColor,
                      value: 'male',
                      groupValue: cubit.gender,
                      onChanged: (value) {
                        cubit.changeGender(value!);
                      },
                    ),
                    Text(
                      'Male',
                      style: cubit.gender == 'male'
                          ? Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Theme.of(context).primaryColor)
                          : Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(width: 70.w),
                    Radio(
                      activeColor: Theme.of(context).primaryColor,
                      value: 'female',
                      groupValue: cubit.gender,
                      onChanged: (value) {
                        cubit.changeGender(value!);
                      },
                    ),
                    Text(
                      'Female',
                      style: cubit.gender == 'female'
                          ? Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Theme.of(context).primaryColor)
                          : Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///TODO: BirthDate

          //Resume
          UploadResume(cubit: cubit, state: state),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
            child: CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  navigateTo(context: context, destination: const HomeScreen());
                }
              },
              backgroundColor: AppColorConstant.appPrimaryColor,
              child: Text(
                AppConstantString.registerHeader,
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ),
          const ConfirmThePrivacy(),
          const NavigateToLogin()
        ],
      ),
    );
  }
}