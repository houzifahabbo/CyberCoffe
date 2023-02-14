import 'package:coffee/product/constants/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerView.rectangular({
    this.width = double.infinity,
    required this.height
  }): this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerView.circular({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder()
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColorScheme.mainAppDarkGreen.withOpacity(0.6),
        highlightColor: AppColorScheme.mainAppDarkGreen.withOpacity(0.4),
        period: const Duration(seconds: 1),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder,
            color: Colors.black,
          ),
        )
    );
  }
}
