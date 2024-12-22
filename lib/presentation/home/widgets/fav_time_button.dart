import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stroll_bonfire/core/extensions/context_extension.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';
import 'package:stroll_bonfire/widgets/app_text.dart';
import 'package:stroll_bonfire/widgets/custom_elevated_button.dart';

class FavTimeButton extends StatelessWidget {
  final bool isSelected;
  final Function() onPressed;
  final ({String content, String placeHolder}) favIItem;

  const FavTimeButton(
      {super.key,
      required this.isSelected,
      required this.onPressed,
      required this.favIItem});

  @override
  Widget build(BuildContext context) {
    // bool isSelected;

    return SizedBox(
      width: context.screenWidth / 2,
      // height: 30,
      child: CustomElevatedButton(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: !isSelected
                  ? BorderSide.none
                  : BorderSide(color: AppColors.primaryClr, width: 2)),
          onPressed: onPressed,
          backgroundColor: AppColors.fromHex('#232A2E'),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: isSelected ? AppColors.fromHex('#8B88EF') : null,
                      border:
                          isSelected ? null : Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: AppText(
                    text: ' ${favIItem.placeHolder} ',
                    fontClr: isSelected ? null : AppColors.fromHex('#C4C4C4'),
                  ),
                ),
                const Gap(10),
                AppText(
                  text: favIItem.content,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontClr: AppColors.fromHex('#C4C4C4'),
                ),
              ],
            ),
          )),
    );
  }
}
