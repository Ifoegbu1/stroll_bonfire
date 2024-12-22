import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';
import 'package:stroll_bonfire/core/utils/generics.dart';


class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;

  final EdgeInsetsGeometry? padding;
  final bool showLoading;
  final EdgeInsetsGeometry margin;
  final Size minimumSize;
  final Size? maximumSize;
  final Size? fixedSize;
  final VisualDensity? visualDensity;
  final Color? pressedColor;
  final OutlinedBorder? shape;
  final AlignmentGeometry? alignment;
  final Color? foregroundColor;
  final double? elevation;
  final Color loadingClr;
  final double loadingSize;
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.showLoading = false,
    this.margin = const EdgeInsets.all(0),
    this.minimumSize = const Size(30, 30), // Default minimum size
    this.maximumSize,
    this.fixedSize,
    this.visualDensity,
    this.pressedColor,
    this.shape,
    this.alignment,
    this.foregroundColor,
    this.elevation,
    this.loadingClr = Colors.black,
    this.loadingSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    Color? defaultBgClr = AppColors.primaryClr;
    return Padding(
      padding: margin,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(elevation),
          foregroundColor: WidgetStatePropertyAll(foregroundColor),
          alignment: alignment,
          surfaceTintColor: WidgetStatePropertyAll(
            backgroundColor ?? defaultBgClr,
          ),
          // disabledBackgroundColor: backgroundColor,
          enableFeedback: true,
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? defaultBgClr,
          ),
          shape: WidgetStatePropertyAll(shape),
          visualDensity: visualDensity,

          minimumSize: WidgetStatePropertyAll(minimumSize),
          fixedSize: WidgetStatePropertyAll(fixedSize),
          maximumSize: WidgetStatePropertyAll(maximumSize),
          padding: WidgetStatePropertyAll(padding),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                if (pressedColor != null) {
                  return pressedColor!
                      .withOpacity(0.2); // Highlight color when pressed
                }
                if (states.contains(WidgetState.disabled)) {
                  return backgroundColor ?? defaultBgClr;
                }
              }
              return null; // Use default color otherwise
            },
          ),
        ),
        onPressed: onPressed,
        child: showLoading ? loadingCircle(loadingSize, loadingClr) : child,
      ),
    );
  }
}
