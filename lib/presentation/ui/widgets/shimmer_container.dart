import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double? width;
  final double? borderRadius;

  const ShimmerContainer({
    super.key,
    required this.height,
     this.width,
    this.borderRadius = 6
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        color: Colors.white,
      ),
    );
  }
}
