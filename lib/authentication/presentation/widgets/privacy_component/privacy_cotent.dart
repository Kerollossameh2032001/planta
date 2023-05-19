import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyContent extends StatelessWidget {
  final bool isTitle;
  final String content;

  const PrivacyContent({
    super.key,
    required this.isTitle,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    if (isTitle) {
      return Padding(
        padding:  EdgeInsets.only(left: 30.0.w,right: 8.0.w,top: 8.0.h,bottom: 8.0.h),
        child: Text(content),
      );
    } else {
      return Padding(
        padding:  EdgeInsets.only(left: 30.0.w,right: 18.0.w,top: 8.0.h,bottom: 8.0.h),
        child: Text(
          content,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 20, color: Colors.grey),
        ),
      );
    }
  }
}