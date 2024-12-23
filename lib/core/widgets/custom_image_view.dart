import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll_bonfire/core/widgets/app_text.dart';

class CustomImageView extends StatelessWidget {
  final String? url;

  final String? imagePath;

  final String? svgPath;

  final File? file;

  final double? height;
  final bool? showForeGDeco;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final bool isProfile;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? radius;
  final BoxBorder? border;
  final Uint8List? bytes;
  final String? placeHolderText;

  const CustomImageView({
    super.key,
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.showForeGDeco,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    this.isProfile = false,
    this.placeHolder = 'assets/images/image_not_found.png',
    this.alignment,
    this.onTap,
    this.margin,
    this.padding,
    this.radius,
    this.border,
    this.bytes,
    this.placeHolderText,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildWidget(),
          )
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: _buildCircleImage(),
        ),
      ),
    );
  }

  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        padding: padding,
        decoration: showForeGDeco == null
            ? BoxDecoration(
                border: border,
                borderRadius: radius,
              )
            : null,
        foregroundDecoration: showForeGDeco != null
            ? BoxDecoration(
                border: border,
                borderRadius: radius,
              )
            : null,
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          // color: color,
          svgPath!,
          height: height,
          width: width,
          colorFilter:
              color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
          fit: fit ?? BoxFit.contain,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        color: color,
        placeholder: (context, url) => SizedBox(
          height: height,
          width: width,
          child: LinearProgressIndicator(
            color: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        errorWidget: (context, url, error) => SizedBox(
          height: height,
          width: width,
          child: const Icon(Icons.broken_image_rounded),
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        colorBlendMode: BlendMode.screen,
        fit: fit ?? BoxFit.cover,
      );
    } else if (bytes != null) {
      return Image.memory(
        bytes!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    }
    return isProfile
        ? AppText(
            text: placeHolderText ?? '',
          )
        : const SizedBox.shrink();
  }
}
