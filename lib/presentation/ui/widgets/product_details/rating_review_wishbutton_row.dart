import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/presentation/state_holders/create_wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingReviewWishButtonRow extends StatelessWidget {
  final ProductDetailsData productDetailsData;
  const RatingReviewWishButtonRow({
    super.key,
    required this.productDetailsData,
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
              '${productDetailsData.product?.star ?? 0}',
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
            Get.to(() => ProductReviewScreen(
                  productId: productDetailsData.productId!,
                ));
          },
          child: const Text(
            'Reviews',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GetBuilder<CreateWishListController>(
            builder: (createWishListController) {
          return SizedBox(
            height: 22,
            child: FittedBox(
              child: Card(
                color: ColorPalette.primaryColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  child: IconButton(
                    onPressed: () async {
                      final response = await createWishListController
                          .createWishList(productDetailsData.productId!);
                      if (response) {
                        Get.snackbar(
                          'Happy Shopping! ツ',
                          'This product has been added to wish list',
                          backgroundColor: Colors.green.withOpacity(.2),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        Get.snackbar(
                          'Opps!',
                          'Unable add to wish to list',
                          backgroundColor: Colors.red.withOpacity(.2),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
