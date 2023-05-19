import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/app_constant_assets_url.dart';
import '../../controller/register_cubit/register_cubit.dart';

class UploadImageProfile extends StatelessWidget {
  final RegisterEngCubit cubit;

  const UploadImageProfile({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 165.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(130),
              bottomRight: Radius.circular(130),
            ),
            image: DecorationImage(
              image: AssetImage(AppConstantAssetsUrl.secondratBackgroundImage),
              fit: BoxFit.cover,
              //opacity: 0.80,
            ),
          ),
        ),
        Positioned(
          top: 100.h,
          left: 126.w,
          child: InkWell(
            onTap: () {
              cubit.pickImage(source: ImageSource.gallery, key: 'profile');
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                image: cubit.profileImage == null
                    ? const DecorationImage(
                  image:
                  AssetImage(AppConstantAssetsUrl.uploadImageAvatar),
                  fit: BoxFit.contain,
                )
                    : DecorationImage(
                  image: FileImage(cubit.profileImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}