import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/app_assets.dart';
import 'package:stroll_bonfire/core/extensions/context_extension.dart';
import 'package:stroll_bonfire/widgets/app_text.dart';
import 'package:stroll_bonfire/widgets/custom_image_view.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageView(
          fit: BoxFit.cover,
          imagePath: AppAssets.ASSETS_IMAGES_HOME_IMG_JPG,
          height: context.screenHeight,
          width: context.screenWidth,
        ),
        const Center(
          child: AppText(
            text: 'Coming Soon',
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
