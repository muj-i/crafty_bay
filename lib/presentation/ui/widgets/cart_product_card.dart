import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImageAssets.productShoe),
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
                      const Expanded(
                        child: Text(
                          'Cart Screen Product Place Holder Text',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.trashCan,
                          size: 18,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                      children: [
                        TextSpan(text: 'Color: Grey, '),
                        TextSpan(text: 'Size: XL'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$100',
                        style: TextStyle(
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
    );
  }
}
