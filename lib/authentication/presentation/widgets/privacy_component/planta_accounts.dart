import 'package:flutter/material.dart';
import 'package:planta/core/constants/app_constant_assets_url.dart';

class PlantaAccounts extends StatelessWidget {
  const PlantaAccounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){},
            child: CircleAvatar(
              backgroundColor: Colors.blue[900],
              child: const Icon(Icons.facebook_outlined,color: Colors.white,),
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: const CircleAvatar(
            backgroundImage: AssetImage(AppConstantAssetsUrl.instagramIcon),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){},
            child: const CircleAvatar(
              backgroundImage: AssetImage(AppConstantAssetsUrl.linkedINIcon),
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: const CircleAvatar(
            backgroundImage: AssetImage(AppConstantAssetsUrl.twitterIcon),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){},
            child: const CircleAvatar(
              backgroundImage: AssetImage(AppConstantAssetsUrl.webIcon),
            ),
          ),
        ),
      ],
    );
  }
}