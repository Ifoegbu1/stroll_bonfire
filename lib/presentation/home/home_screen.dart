import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/app_assets.dart';
import 'package:stroll_bonfire/core/extensions/context_extension.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';
import 'package:stroll_bonfire/presentation/home/widgets/home_content.dart';
import 'package:stroll_bonfire/widgets/custom_image_view.dart';

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
            height: context.screenHeight,
            width: context.screenWidth,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    // tileMode: TileMode.decal,
                    end: Alignment.bottomCenter,
                    colors: [
                  AppColors.fromHex('#0F1115').withOpacity(0.0),
                  AppColors.fromHex('#0D0E12').withOpacity(0.28),
                  AppColors.fromHex('#0B0C0F').withOpacity(0.64),
                  AppColors.fromHex('#090B0D').withOpacity(0.80),
                  Colors.black
                ])),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(radius: 1, colors: [
              AppColors.fromHex('#000000').withOpacity(0.045),
              AppColors.fromHex('#000000').withOpacity(0.10),
              AppColors.fromHex('#000000').withOpacity(0.13),
              AppColors.fromHex('#000000').withOpacity(0.19),
              AppColors.fromHex('#000000').withOpacity(0.24),
            ])),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                  AppColors.fromHex('#000000').withOpacity(0.4),
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
