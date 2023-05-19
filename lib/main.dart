import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/core/constants/app_constant_string.dart';
import 'package:planta/core/global/theme/light_theme.dart';

import 'authentication/presentation/screen/splash_screen.dart';
import 'core/services/bloc_oberver.dart';

void main() {
  //runApp(DevicePreview(builder: (context) => const MyApp()));
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          builder: DevicePreview.appBuilder,
          title: AppConstantString.appTitle,
          theme: getLightTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },

    );
  }
}
