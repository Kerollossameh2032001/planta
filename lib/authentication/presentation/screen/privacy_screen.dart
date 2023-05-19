import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/authentication/presentation/screen/check_prvacy_screen.dart';
import 'package:planta/authentication/presentation/screen/register_as_farmer_screen.dart';
import 'package:planta/authentication/presentation/screen/registure_as_an_agricultural_eng.dart';
import 'package:planta/core/constants/app_constant_assets_url.dart';
import 'package:planta/core/constants/app_constant_string.dart';
import 'package:planta/core/global/components/custom_button.dart';
import 'package:planta/core/global/components/logo_layout.dart';
import 'package:planta/core/global/components/navigate_to.dart';

import '../../../core/constants/app_color_constant.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.93,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80)),
              image: DecorationImage(
                image: AssetImage(AppConstantAssetsUrl.secondratBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                SizedBox(
                  height: 230.h,
                  child: const LogoLayout(),
                ),
                Text(
                  AppConstantString.appTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  AppConstantString.appSubTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0.h, left: 35.0.w, right: 35.0.w, bottom: 15.0.h),
                  child: CustomButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      navigateTo(
                          context: context,
                          destination: RegisterAsFarmerScreen());
                    },
                    child: Text(
                      AppConstantString.registerAsFarmer,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0.h, left: 35.0.w, right: 35.0.w, bottom: 15.0.h),
                  child: CustomButton(
                    onPressed: () {
                      navigateTo(
                          context: context,
                          destination: RegisterAsAgricultureEngineer());
                    },
                    backgroundColor:
                        AppColorConstant.secondaryAppPrimaryDarkColor,
                    child: Text(
                      AppConstantString.registerAsAgriculturalEng,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              navigateTo(
                  context: context, destination: const CheckPrivacyScreen());
            },
            child: Text(
              AppConstantString.privacyButton,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor, fontSize: 25.sp),
            ),
          ),
        ],
      ),
    );
  }
}
