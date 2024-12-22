import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stroll_bonfire/core/app_assets.dart';
import 'package:stroll_bonfire/widgets/app_text.dart';
import 'package:stroll_bonfire/widgets/custom_image_view.dart';

class StrollTime extends StatelessWidget {
  const StrollTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          svgPath: AppAssets.ASSETS_ICONS_TIMER_SVG,
        ),
        Gap(5),
        AppText(
          text: '22h 00m',
          fontSize: 12,
          fontClr: Colors.white,
        ),
        Gap(15),
        CustomImageView(
          svgPath: AppAssets.ASSETS_ICONS_USER_SVG,
          color: Colors.white,
          height: 20,
          width: 20,
        ),
        Gap(2),
        AppText(
          text: '103',
          fontSize: 12,
          fontClr: Colors.white,
        ),
      ],
    );
  }
}
