import 'dart:io';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/theme/theme_config.dart';
import 'package:stroll_bonfire/presentation/home/app_bottom_bar/app_bottom_bar.dart';

void main() {
  // await precacheImage(AssetImage('assets/images/large_image.png'), null);

  runApp(DevicePreview(
      enabled: kDebugMode,
      tools: [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(
          onScreenshot: screenshotAsFiles(
              Directory('/home/ifoegbu1/LATEST WORK/STROLL/screenshots')),
        ),
      ],
      builder: (context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Stroll Bonfire',
      theme: appLightTheme,
      home: const AppBottomBar(),
    );
  }
}
