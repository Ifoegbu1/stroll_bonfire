import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/app_assets.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';
import 'package:stroll_bonfire/presentation/home/home_screen.dart';
import 'package:stroll_bonfire/presentation/other/coming_soon.dart';
import 'package:stroll_bonfire/widgets/app_text.dart';
import 'package:stroll_bonfire/widgets/custom_image_view.dart';
import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    var pages = [
      const ComingSoon(),
      const HomeScreen(),
      const ComingSoon(),
      const ComingSoon()
    ];

    var icons = [
      AppAssets.ASSETS_ICONS_CARD_SVG,
      AppAssets.ASSETS_ICONS_BONFIRE_SVG,
      AppAssets.ASSETS_ICONS_CHAT_SVG,
      AppAssets.ASSETS_ICONS_USER_SVG,
    ];
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ScaleIndexedStack(
        beginScale: 0.0,
        index: activeIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        children: pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        blurEffect: true,
        height: 50,
        elevation: 10,
        backgroundColor: AppColors.fromHex('#0F1115'),
        itemCount: icons.length,
        tabBuilder: (index, isActive) {
          return Transform.scale(
            scale: index == 3 ? 0.8 : 0.6,
            child: Center(
              child: badges.Badge(
                  position: badges.BadgePosition.topStart(start: 25, top: 5),
                  badgeAnimation: const badges.BadgeAnimation.slide(),
                  showBadge: index == 1 || index == 2,
                  badgeStyle: badges.BadgeStyle(
                    borderRadius: BorderRadius.circular(15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    badgeColor: AppColors.primaryClr,
                  ),
                  badgeContent: AppText(
                    text: index == 2 ? '10' : '',
                    fontClr: Colors.black,
                  ),
                  child: CustomImageView(
                    svgPath: icons[index],
                    color: isActive ? AppColors.primaryClr : null,
                    height: 44,
                    width: 44,
                  )),
            ),
          );
        },
        gapLocation: GapLocation.none,
        activeIndex: activeIndex,
        onTap: (value) {
          if (activeIndex != value) {
            setState(() {
              activeIndex = value;
            });
          }
        },
      ),
    );
  }
}
