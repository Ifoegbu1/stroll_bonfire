import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stroll_bonfire/core/app_assets.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';
import 'package:stroll_bonfire/core/widgets/app_text.dart';
import 'package:stroll_bonfire/core/widgets/custom_elevated_button.dart';
import 'package:stroll_bonfire/core/widgets/custom_image_view.dart';

class PickOptionWidget extends StatelessWidget {
  const PickOptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppText(
          text: 'Pick your option.\nSee who has a similar mind.',
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        Row(
          children: [
            CustomElevatedButton(
                padding: const EdgeInsets.all(16),
                shape: CircleBorder(
                    side: BorderSide(color: AppColors.primaryClr, width: 2)),
                backgroundColor: Colors.transparent,
                onPressed: () {},
                child: const CustomImageView(
                  svgPath: AppAssets.ASSETS_ICONS_MIC_SVG,
                )),
            const Gap(10),
            CustomElevatedButton(
                pressedColor: Colors.white,
                padding: const EdgeInsets.all(16),
                shape: const CircleBorder(),
                backgroundColor: AppColors.primaryClr,
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 23,
                ))
          ],
        )
      ],
    );
  }
}
