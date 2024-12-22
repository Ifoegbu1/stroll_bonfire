import 'dart:io';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/theme/theme_config.dart';
import 'package:stroll_bonfire/presentation/home/home_screen.dart';

void main() {
  runApp(DevicePreview(
      enabled: kDebugMode,
      tools: [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(
          onScreenshot:
              screenshotAsFiles(Directory('/storage/emulated/0/Pictures')),
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
      home: const HomeScreen(),
    );
  }
}
