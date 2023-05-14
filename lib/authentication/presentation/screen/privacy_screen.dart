import 'package:flutter/material.dart';
import 'package:planta/authentication/presentation/screen/check_prvacy_screen.dart';
import 'package:planta/authentication/presentation/screen/register_screen.dart';
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
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80)),
              image: DecorationImage(
                image: AssetImage(AppConstantAssetsUrl.privacyBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 250,
                  child: LogoLayout(),
                ),
                Text(
                  AppConstantString.appTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  AppConstantString.appSubTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 15.0),
                  child: CustomButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      navigateTo(context: context, destination: RegisterAsFarmerScreen());
                    },
                    child: Text(
                      AppConstantString.registerAsFarmer,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: CustomButton(
                    onPressed: () {},
                    backgroundColor: AppColorConstant.secondaryAppPrimaryDarkColor,
                    child: Text(
                      AppConstantString.registerAsAgriculturalEng,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              navigateTo(context: context, destination: const CheckPrivacyScreen());
            },
            child: Text(
              AppConstantString.privacyButton,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
