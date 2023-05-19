

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_constant_colors.dart';
import '../../constants/app_size_costant.dart';

ThemeData getLightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
    ),
    elevation: 0.0,
  ),
  primaryColor: AppConstantColor.primaryColor,
  textTheme:  TextTheme(
    titleLarge: TextStyle(
      color: AppConstantColor.titleLargeColor,
      fontSize: AppSizeConstant.titleLargeFontSize.sp,
    ),
    titleSmall: TextStyle(
      letterSpacing: AppSizeConstant.titleSmallSpacingLetter.sp,
      color: AppConstantColor.titleLargeColor,
      height: AppSizeConstant.titleSmallHeight.h,
    ),
    bodyLarge: TextStyle(
      color: AppConstantColor.titleLargeColor,
      fontSize: AppSizeConstant.bodyLargeFontSize.sp,
    ),
    bodySmall: TextStyle(
        fontSize: AppSizeConstant.bodySmallFontSize.sp,
        color: const Color.fromRGBO(196, 175, 159, 1)),
    bodyMedium: TextStyle(
      color: AppConstantColor.bodyMediumColor,
      fontWeight: FontWeight.bold,
      fontSize: AppSizeConstant.bodyMediumFontSize.sp,
    ),
    labelMedium: TextStyle(
      color: AppConstantColor.labelMediumColor,
      fontSize: AppSizeConstant.labelMediumFontSize.sp,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
    filled: true,
    fillColor: AppConstantColor.secondaryPrimaryColor,
    floatingLabelStyle: TextStyle(
      color: AppConstantColor.primaryColor,
      height: 0.h,
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
    ),
    focusColor: AppConstantColor.primaryColor,
    prefixIconColor: AppConstantColor.primaryColor,
    suffixIconColor: AppConstantColor.primaryColor,
    floatingLabelAlignment: FloatingLabelAlignment.start,
  ),
);
