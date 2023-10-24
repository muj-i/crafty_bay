import 'package:crafty_bay/data/models/product_data.dart';
import 'package:crafty_bay/presentation/state_holders/create_wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductData? productData;

  const ProductCard({
    super.key,
    this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(() => ProductDetailsScreen(
              productId: productData!.id!,
            ));
      },
      child: Card(
        shadowColor: ColorPalette.primaryColor.withOpacity(0.1),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorPalette.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Image.network(
                  productData?.image ?? '',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productData?.title ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "৳${productData?.price ?? ''}",
                          maxLines: 1,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                        const Spacer(),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Text(
                              productData?.star.toString() ?? '',
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GetBuilder<CreateWishListController>(
                            builder: (createWishListController) {
                          return SizedBox(
                            height: 22,
                            child: FittedBox(
                              child: Card(
                                color: ColorPalette.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.favorite_border_rounded,
                                      size: 32,
                                    ),
                                    color: Colors.white,
                                    onPressed: () async {
                                      final response =
                                          await createWishListController
                                              .createWishList(productData!.id!);
                                      if (response) {
                                        Get.snackbar(
                                          'Happy Shopping! ツ',
                                          'This product has been added to wish list',
                                          backgroundColor:
                                              Colors.green.withOpacity(.2),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else {
                                        Get.offAll(() =>
                                            const EmailVerificationScreen());
                                        Get.snackbar(
                                          'Opps!',
                                          ' You need to complete your profile before adding items to wish list.',
                                          backgroundColor:
                                              Colors.red.withOpacity(.2),
                                          snackPosition: SnackPosition.TOP,
                                          duration: const Duration(seconds: 15),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
