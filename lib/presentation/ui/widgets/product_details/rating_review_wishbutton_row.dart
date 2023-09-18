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
        const Wrap(
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '4.8',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          ],
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
        const Card(
          color: ColorPalette.primaryColor,
          child: Padding(
            padding: EdgeInsets.all(2.0),
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
