import 'package:crafty_bay/data/models/cart_and_wish_list_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WishListProductCard extends StatelessWidget {
  final CartAndWishData wishData;
  final VoidCallback onPressed;
  const WishListProductCard({
    super.key,
    required this.onPressed,
    required this.wishData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(
          () => ProductDetailsScreen(
            productId: wishData.productId!,
          ),
        );
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
                  wishData.productData?.image ?? '',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wishData.productData?.title ??
                          'Wished product name not found',
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
                          "৳${wishData.productData?.price ?? '0'}",
                          maxLines: 1,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Text(
                              wishData.productData?.star.toString() ?? '0',
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
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          height: 22,
                          child: FittedBox(
                            child: Card(
                              color: ColorPalette.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.trashCan,
                                    size: 32,
                                  ),
                                  color: Colors.white,
                                  onPressed: onPressed,
                                ),
                              ),
                            ),
                          ),
                        ),
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
