import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingReviewWishButtonRow extends StatelessWidget {
  const RatingReviewWishButtonRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '${Get.find<ProductDetailsController>().productDetailsData.product?.star ?? 0}',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const ProductReviewScreen());
          },
          child: const Text(
            'Reviews',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Card(
          color: ColorPalette.primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            child: Icon(
              Icons.favorite_border,
              size: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
