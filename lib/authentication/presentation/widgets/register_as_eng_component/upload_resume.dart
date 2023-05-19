import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/core/constants/app_constant_string.dart';
import '../../../../core/constants/app_constant_colors.dart';
import '../../controller/register_cubit/register_cubit.dart';
import '../../controller/register_cubit/register_state.dart';
import 'document_item.dart';

class UploadResume extends StatelessWidget {
  const UploadResume({
    super.key,
    required this.cubit,
    required this.state,
  });

  final RegisterEngCubit cubit;
  final RegisterEngStates state;

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
          const Text(AppConstantString.uploadResumeLabelText),
          TextButton(
            onPressed: () {
              cubit.pickDocument();
            },
            child: Text(
              AppConstantString.uploadResumeTextButton,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColor, fontSize: 15.sp),
            ),
          ),
          if (state is RegisterEngPickResumeLoadingState)
            LinearProgressIndicator(color: Theme.of(context).primaryColor),
          SizedBox(height: 12.h),
          if (cubit.resume != null)
            DocumentItem(
              details: cubit.resumeDetails,
              document: cubit.resume,
            )
        ],
      ),
    );
  }
}