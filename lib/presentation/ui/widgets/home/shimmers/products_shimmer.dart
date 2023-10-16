import 'package:crafty_bay/presentation/ui/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsShimmer extends StatelessWidget {
  const ProductsShimmer({super.key});

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
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContainer(
                    height: 20.0,
                    width: 120,
                  ),
                  ShimmerContainer(
                    height: 20.0,
                    width: 45,
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  ShimmerContainer(
                    height: 123.0,
                    width: 113,
                  ),
                  Spacer(),
                  ShimmerContainer(
                    height: 123.0,
                    width: 113,
                  ),
                  Spacer(),
                  ShimmerContainer(
                    height: 123.0,
                    width: 113,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
