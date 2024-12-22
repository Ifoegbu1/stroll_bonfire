import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:stroll_bonfire/core/app_assets.dart';
import 'package:stroll_bonfire/core/extensions/context_extension.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';
import 'package:stroll_bonfire/presentation/home/widgets/fav_time_button.dart';
import 'package:stroll_bonfire/presentation/home/widgets/stroll_time.dart';
import 'package:stroll_bonfire/widgets/app_text.dart';
import 'package:stroll_bonfire/widgets/custom_elevated_button.dart';
import 'package:stroll_bonfire/widgets/custom_image_view.dart';

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
      (placeHolder: 'C', content: 'The peace in the \nearly mornings'),
      (placeHolder: 'B', content: 'The magical \ngolden hours'),
      (placeHolder: 'C', content: 'Wind-down time \nafter dinners'),
      (placeHolder: 'D', content: 'The serenity past \nmidnight'),
    ];
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            AppText(
              text: 'Stroll Bonfire',
              fontSize: 34,
              fontWeight: FontWeight.w600,
              fontClr: AppColors.fromHex('#CCC8FF'),
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
                  color: AppColors.fromHex('#010101'),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: context.screenWidth * 0.2),
                        child: const AppText(
                          text: 'What is your favorite time \nof the day?',
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                          fontSize: 20,

                          // fontClr: Colors.white,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            text:
                                'Pick your option.\nSee who has a similar mind.',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          Row(
                            children: [
                              CustomElevatedButton(
                                  padding: const EdgeInsets.all(16),
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          color: AppColors.primaryClr,
                                          width: 2)),
                                  backgroundColor: Colors.transparent,
                                  onPressed: () {},
                                  child: const CustomImageView(
                                    svgPath: AppAssets.ASSETS_ICONS_MIC_SVG,
                                    // color: COlrs,
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

                                    // color: COlrs,
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),

                // Positioned(
                //   left: 20,
                //   top: -30,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.black, // Background color of the card
                //       borderRadius: BorderRadius.circular(20.0),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 12.0, vertical: 8.0),
                //     child: const Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         // Profile image
                //         CircleAvatar(
                //           radius: 28.0, // Size of the avatar
                //           backgroundImage: AssetImage(AppAssets
                //               .ASSETS_IMAGES_JOEY_JPEG), // Replace with your image path
                //         ),
                //         SizedBox(width: 10.0),
                //         // Name and age text
                //         Text(
                //           'Angelina, 28',
                //           style: TextStyle(
                //             color: Colors.white, // Text color
                //             fontSize: 18.0,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Positioned(
                  left: 82,
                  top: -20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.fromHex('#121517'),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(5),
                    child: const AppText(
                      text: '     Angelina, 28  ',
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
                      // showForeGDeco: true,
                      // border: Border.all(
                      //   color: AppColors.fromHex('#121517'),
                      //   width: 7,
                      // ),
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
