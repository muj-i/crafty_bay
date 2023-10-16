import 'package:crafty_bay/presentation/ui/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeSliderShimmer extends StatelessWidget {
  const HomeSliderShimmer({super.key});

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
              ShimmerContainer(height: 200.0, width: double.infinity),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerContainer(height: 12.0, width: 12, borderRadius: 50),
                  SizedBox(width: 8),
                  ShimmerContainer(height: 12.0, width: 12, borderRadius: 50),
                  SizedBox(width: 8),
                  ShimmerContainer(height: 12.0, width: 12, borderRadius: 50),
                  SizedBox(width: 8),
                  ShimmerContainer(height: 12.0, width: 12, borderRadius: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
