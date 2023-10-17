import 'package:crafty_bay/presentation/ui/widgets/auth/auth_screens_upper_parts.dart';
import 'package:crafty_bay/presentation/ui/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CompleteScreenShimmer extends StatelessWidget {
  const CompleteScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: const SafeArea(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthScreensUpperParts(
                title: 'Complete Profile',
                subTitle: 'Get started wiyh us with your details',
              ),
              ShimmerContainer(height: 50.0, width: 400),
              SizedBox(height: 16),
              ShimmerContainer(height: 50.0, width: 400),
              SizedBox(height: 16),
              ShimmerContainer(height: 50.0, width: 400),
              SizedBox(height: 16),
              ShimmerContainer(height: 50.0, width: 400),
              SizedBox(height: 16),
              ShimmerContainer(height: 100.0, width: 400),
              SizedBox(height: 16),
              ShimmerContainer(height: 38.0, width: 400),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
