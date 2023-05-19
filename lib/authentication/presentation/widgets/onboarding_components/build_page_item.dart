import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/core/constants/app_constant_colors.dart';

import 'onboaring_model.dart';

class BuildPageItem extends StatelessWidget {
  final PageContent model;

  const BuildPageItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 25.0.h,left: 30.w),
          child: Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.height*0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(model.image),
              ),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 30.0.w,right: 12.0.w),
          child: Text(model.title, style: Theme
              .of(context)
              .textTheme
              .titleLarge!.copyWith(color: AppConstantColor.primaryColor,fontSize: 30.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
          child: Text(model.subTitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!.copyWith(fontSize: 15.sp),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}