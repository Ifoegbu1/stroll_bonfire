import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/app_assets.dart';
import 'package:stroll_bonfire/core/extensions/context_extension.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';
import 'package:stroll_bonfire/presentation/home/widgets/home_content.dart';
import 'package:stroll_bonfire/core/widgets/custom_image_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          CustomImageView(
              fit: BoxFit.cover,
              imagePath: AppAssets.ASSETS_IMAGES_HOME_IMG_JPG,
              // height: 500,
              height: context.screenHeight * 0.6,
              width: context.screenWidth),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                  AppColors.fromHex('#000000').withOpacity(0.12),
                  AppColors.fromHex('#000000').withOpacity(0.0),
                ])),
          ),
          const HomeContent(),
        ],
      ),
    );
  }
}
