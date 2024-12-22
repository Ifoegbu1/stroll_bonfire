import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingCircle(
    [double size = 40,
    Color color = Colors.black,
    Alignment alignment = Alignment.center]) {
  return Align(
    alignment: alignment,
    child: LoadingAnimationWidget.threeArchedCircle(
      color: color,
      size: size,
    ),
  );
}
