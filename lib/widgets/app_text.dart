
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontWeight? highLightWeight;
  final Color? fontClr;
  final Color? txtHighlightClr;
  final String? fontFamily;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final FontStyle? fontStyle;
  final bool shouldHighlight;
  final List<String> wordHighlight;
  final double? decorationThickness;
  final double? textHeight;
  final TextDecoration? decoration;
  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.highLightWeight,
    this.fontClr = Colors.black,
    this.txtHighlightClr,
    this.fontFamily,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.fontStyle,
    this.shouldHighlight = false,
    this.wordHighlight = const [],
    this.decorationThickness,
    this.textHeight,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return SubstringHighlight(
      maxLines: maxLines ?? 3,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
      text: text,

      // term: wordHighlight,
      terms: wordHighlight,
      textStyleHighlight: TextStyle(
        fontSize: fontSize,
        height: textHeight,
        fontWeight: highLightWeight ?? fontWeight,
        color: txtHighlightClr,
        fontFamily: 'ProximaNova',
      ),
      textStyle: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        height: textHeight,
        fontWeight: fontWeight,
        color: fontClr,
        fontFamily: 'ProximaNova',
        overflow: textOverflow,
        // decorationStyle: TextDecorationStyle.solid,
        decorationThickness: decorationThickness,
        decorationColor: fontClr,
        fontStyle: fontStyle,
      ),
    );
  }
}
