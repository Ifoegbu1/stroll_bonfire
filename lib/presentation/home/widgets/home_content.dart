import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:stroll_bonfire/core/app_assets.dart';
import 'package:stroll_bonfire/core/extensions/context_extension.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';
import 'package:stroll_bonfire/presentation/home/widgets/fav_time_button.dart';
import 'package:stroll_bonfire/presentation/home/widgets/pick_option_widget.dart';
import 'package:stroll_bonfire/presentation/home/widgets/stroll_time.dart';
import 'package:stroll_bonfire/core/widgets/app_text.dart';
import 'package:stroll_bonfire/core/widgets/custom_image_view.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int currentFav = 3;
  @override
  Widget build(BuildContext context) {
    var favTimes = [
      (placeHolder: 'A', content: 'The peace in the \nearly mornings'),
      (placeHolder: 'B', content: 'The magical \ngolden hours'),
      (placeHolder: 'C', content: 'Wind-down time \nafter dinners'),
      (placeHolder: 'D', content: 'The serenity past \nmidnight'),
    ];
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: 'Stroll Bonfire',
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                  fontClr: AppColors.fromHex('#CCC8FF'),
                ),
                const Gap(3),
                IconButton(
                    onPressed: () {},
                    icon: Transform.rotate(
                        angle: pi / 2,
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColors.fromHex('#CCC8FF'),
                          size: 17,
                        )))
              ],
            ),
            const StrollTime(),
            const Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  height: context.screenHeight / 2.5,
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    color: AppColors.fromHex('#010101'),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, -9),
                          blurRadius: 8,
                          spreadRadius: 10),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: context.screenWidth * 0.1),
                        child: const AppText(
                          text: 'What is your favorite time \nof the day?',
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                          fontSize: 20,
                        ),
                      ),
                      const Gap(10),
                      AppText(
                        text: '“Mine is definitely the peace in the morning.”',
                        fontClr: AppColors.fromHex('#CBC9FF').withOpacity(0.7),
                        fontStyle: FontStyle.italic,
                      ),
                      const Gap(20),
                      Expanded(
                        child: AlignedGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          itemCount: favTimes.length,
                          crossAxisSpacing: 10,
                          itemBuilder: (context, index) {
                            final favIItem = favTimes[index];
                            return FavTimeButton(
                              isSelected: currentFav == index,
                              favIItem: favIItem,
                              onPressed: () {
                                setState(() {
                                  currentFav = index;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const PickOptionWidget()
                    ],
                  ),
                ),
                Positioned(
                  left: 82,
                  top: -20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.fromHex('#121517'),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(5),
                    child: const AppText(
                      text: '     Angelina, 28   ',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: -30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(54),
                      border: Border.all(
                        color: AppColors.fromHex('#121517'),
                        width: 7,
                      ),
                    ),
                    child: CustomImageView(
                      imagePath: AppAssets.ASSETS_IMAGES_JOEY_JPEG,
                      width: 60,
                      height: 60,
                      radius: BorderRadius.circular(54),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
