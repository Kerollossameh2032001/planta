import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_constant_colors.dart';
import '../../../../core/constants/app_constant_string.dart';
import '../../controller/register_cubit/register_cubit.dart';
import '../../controller/register_cubit/register_state.dart';

class UploadPersonalIDPhoto extends StatelessWidget {
  final RegisterEngCubit cubit;
  final RegisterEngStates state;

  const UploadPersonalIDPhoto({
    super.key,
    required this.cubit,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppConstantColor.secondaryPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstantString.uploadPersonalDPhotoLabelText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20.sp,
              //fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
            onPressed: () {
              cubit.pickImage(source: ImageSource.gallery, key: 'personalID');
            },
            child: Text(
              AppConstantString.uploadPersonalDPhotoTextButton,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColor, fontSize: 15.sp),
            ),
          ),
          if (state is RegisterEngPickImageLoadingState)
            LinearProgressIndicator(color: Theme.of(context).primaryColor),
          SizedBox(height: 12.h),
          if (cubit.personalIDImage != null)
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: FileImage(cubit.personalIDImage!),
                    fit: BoxFit.cover,
                  )),
            ),
        ],
      ),
    );
  }
}