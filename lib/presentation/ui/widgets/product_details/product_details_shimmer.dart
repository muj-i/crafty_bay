import 'package:crafty_bay/presentation/ui/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SafeArea(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShimmerContainer(height: 250.0, width: double.infinity),
              const SizedBox(height: 20),
              const Row(
                children: [
                  ShimmerContainer(height: 20.0, width: 190),
                  Spacer(),
                  ShimmerContainer(height: 20.0, width: 70),
                ],
              ),
              const SizedBox(height: 6),
              const ShimmerContainer(height: 20.0, width: 140),
              const SizedBox(height: 30),
              const Row(
                children: [
                  ShimmerContainer(height: 20.0, width: 30),
                  SizedBox(width: 6),
                  ShimmerContainer(height: 20.0, width: 60),
                  SizedBox(width: 6),
                  ShimmerContainer(height: 20.0, width: 25),
                ],
              ),
              const SizedBox(height: 30),
              const ShimmerContainer(height: 20.0, width: 50),
              const SizedBox(height: 6),
              const Row(
                children: [
                  ShimmerContainer(height: 25.0, width: 25, borderRadius: 50),
                  SizedBox(width: 12),
                  ShimmerContainer(height: 25.0, width: 25, borderRadius: 50),
                  SizedBox(width: 12),
                  ShimmerContainer(height: 25.0, width: 25, borderRadius: 50),
                  SizedBox(width: 12),
                  ShimmerContainer(height: 25.0, width: 25, borderRadius: 50),
                  SizedBox(width: 12),
                  ShimmerContainer(height: 25.0, width: 25, borderRadius: 50),
                ],
              ),
              const SizedBox(height: 30),
              const ShimmerContainer(height: 20.0, width: 50),
              const SizedBox(height: 6),
              const Row(
                children: [
                  ShimmerContainer(height: 25.0, width: 40, borderRadius: 50),
                  SizedBox(width: 12),
                  ShimmerContainer(height: 25.0, width: 40, borderRadius: 50),
                  SizedBox(width: 12),
                  ShimmerContainer(height: 25.0, width: 40, borderRadius: 50),
                  SizedBox(width: 12),
                  ShimmerContainer(height: 25.0, width: 40, borderRadius: 50),
                ],
              ),
              const SizedBox(height: 30),
              const ShimmerContainer(height: 20.0, width: 100),
              const SizedBox(height: 6),
              const ShimmerContainer(height: 20.0),
              const SizedBox(height: 6),
              const ShimmerContainer(height: 20.0),
              const SizedBox(height: 6),
              const ShimmerContainer(height: 20.0, width: 70),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [SizedBox(height: 38)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
