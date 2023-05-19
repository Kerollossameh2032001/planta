import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_color_constant.dart';
import 'onboaring_model.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: pageData.length,
      effect:  WormEffect(
        activeDotColor: AppColorConstant.appPrimaryColor,
        dotColor: AppColorConstant.secondaryAppPrimaryDarkColor,
        dotHeight: 10.h,
        dotWidth: 10.w,
      ),
      axisDirection: Axis.horizontal,
    );
  }
}