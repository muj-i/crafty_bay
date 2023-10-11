import 'package:crafty_bay/data/models/cart_and_wish_list_model.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/delete_cart_item_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final CartAndWishData cartData;
  const CartProductCard({
    super.key,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(
          () => ProductDetailsScreen(
            productId: cartData.productId!,
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartData.productData?.image ??
                      'https://assets.adidas.com/images/w_600,f_auto,q_auto/f9d52817f7524d3fb442af3b01717dfa_9366/Runfalcon_3.0_Shoes_Black_HQ3790_01_standard.jpg'),
                ),
                color: Colors.transparent,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            cartData.productData?.title ??
                                'Product name not found',
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.find<DeleteCartItemController>()
                                .deleteCartItem(cartData.productId.toString());
                            Get.find<CartListController>().getCartList();
                          },
                          icon: const Icon(
                            FontAwesomeIcons.trashCan,
                            size: 18,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 12),
                        children: [
                          TextSpan(text: 'Color: ${cartData.color ?? ''}, '),
                          TextSpan(text: 'Size: ${cartData.size ?? ''}'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartData.productData?.price ?? '0',
                          style: const TextStyle(
                              color: ColorPalette.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 85,
                          child: FittedBox(
                            child: CustomStepper(
                              lowerLimit: 1,
                              upperLimit: 20,
                              stepValue: 1,
                              value: 1,
                              onChange: (int value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
