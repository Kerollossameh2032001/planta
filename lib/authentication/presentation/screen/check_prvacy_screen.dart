import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planta/authentication/presentation/widgets/privacy_component/planta_accounts.dart';
import 'package:planta/authentication/presentation/widgets/privacy_component/privacy_cotent.dart';
import 'package:planta/core/constants/app_constant_assets_url.dart';
import '../../../core/constants/app_color_constant.dart';
import '../../../core/constants/app_constant_string.dart';
import '../../../core/global/components/logo_layout.dart';

class CheckPrivacyScreen extends StatelessWidget {
  const CheckPrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
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
                  SizedBox(height: 50.h),
                  SizedBox(
                    height: 220.h,
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
                ],
              ),
            ),
            const PrivacyContent(
                content: PrivacyParagraph.privacyTitle, isTitle: true),
            const PrivacyContent(
                content: PrivacyParagraph.intro, isTitle: false),
            const PrivacyContent(
                content: PrivacyParagraph.point1, isTitle: true),
            const PrivacyContent(
                content: PrivacyParagraph.point1Body, isTitle: false),
            const PrivacyContent(
                content: PrivacyParagraph.point2, isTitle: true),
            const PrivacyContent(
                content: PrivacyParagraph.point2Body, isTitle: false),
            const PrivacyContent(
                content: PrivacyParagraph.point3, isTitle: true),
            const PrivacyContent(
                content: PrivacyParagraph.point3Body, isTitle: false),
            const PrivacyContent(
                content: PrivacyParagraph.point4, isTitle: true),
            const PrivacyContent(
                content: PrivacyParagraph.point4Body, isTitle: false),
            const PrivacyContent(
                content: PrivacyParagraph.point5, isTitle: true),
            const PrivacyContent(
                content: PrivacyParagraph.point5Body, isTitle: false),
            const PrivacyContent(
                content: PrivacyParagraph.point6, isTitle: true),
            const PrivacyContent(
                content: PrivacyParagraph.point6Body, isTitle: false),
            const PrivacyContent(
                content: PrivacyParagraph.point7, isTitle: true),
            const PrivacyContent(
                content: PrivacyParagraph.point7Body, isTitle: false),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0.w),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  PrivacyParagraph.contactEmail,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor, fontSize: 18),
                ),
              ),
            ),
            const PrivacyContent(
                content: PrivacyParagraph.conclusion, isTitle: false),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.016,
            ),
            const PlantaAccounts(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.036,
            ),
          ],
        ),
      ),
    );
  }
}


