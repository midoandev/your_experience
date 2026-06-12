import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageDefault extends StatelessWidget {
  final String assetImage;
  final double? height;
  final double? width;
  final double borderCircular;
  final EdgeInsetsGeometry? padding;
  final BoxFit boxFit;

  const ImageDefault({
    super.key,
    required this.assetImage,
    this.height,
    this.width,
    this.borderCircular = 0,
    this.padding,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderCircular),
        child: SizedBox(
          height: height,
          width: width,
          child: assetImage.isEmpty
              ? Container(
                  color: Colors.grey.shade300,
                  child: SvgPicture.asset(
                    'assets/vector/not_found_image.svg',
                    fit: BoxFit.cover,
                  ),
                )
              : Image.asset(
                  assetImage,
                  fit: boxFit,
                  errorBuilder: (_, _, _) => Container(
                    color: Colors.grey.shade300,
                    child: SvgPicture.asset(
                      'assets/vector/not_found_image.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
