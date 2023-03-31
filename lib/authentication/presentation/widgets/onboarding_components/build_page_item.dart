import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(top: 25.0),
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(model.image),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(model.title, style: Theme
              .of(context)
              .textTheme
              .titleLarge!.copyWith(color: AppConstantColor.primaryColor,fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(model.subTitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!.copyWith(fontSize: 15),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}