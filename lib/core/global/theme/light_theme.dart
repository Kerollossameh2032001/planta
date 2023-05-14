

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: AppConstantColor.titleLargeColor,
      fontSize: AppSizeConstant.titleLargeFontSize,
    ),
    titleSmall: TextStyle(
      letterSpacing: AppSizeConstant.titleSmallSpacingLetter,
      color: AppConstantColor.titleLargeColor,
      height: AppSizeConstant.titleSmallHeight,
    ),
    bodyLarge: TextStyle(
      color: AppConstantColor.titleLargeColor,
      fontSize: AppSizeConstant.bodyLargeFontSize,
    ),
    bodySmall: TextStyle(
        fontSize: AppSizeConstant.bodySmallFontSize,
        color: Color.fromRGBO(196, 175, 159, 1)),
    bodyMedium: TextStyle(
      color: AppConstantColor.bodyMediumColor,
      fontWeight: FontWeight.bold,
      fontSize: AppSizeConstant.bodyMediumFontSize,
    ),
    labelMedium: TextStyle(
      color: AppConstantColor.labelMediumColor,
      fontSize: AppSizeConstant.labelMediumFontSize,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    filled: true,
    fillColor: AppConstantColor.secondaryPrimaryColor,
    floatingLabelStyle: const TextStyle(
      color: AppConstantColor.primaryColor,
      height: 0,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    focusColor: AppConstantColor.primaryColor,
    prefixIconColor: AppConstantColor.primaryColor,
    suffixIconColor: AppConstantColor.primaryColor,
    floatingLabelAlignment: FloatingLabelAlignment.start,
  ),
);
