import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
       borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(const ProductListScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: ColorPalette.primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.tv,
                  size: 32,
                  color: ColorPalette.primaryColor,
                )),
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Electronics',
              style: TextStyle(
                  fontSize: 15,
                  color: ColorPalette.primaryColor,
                  letterSpacing: 0.4),
            )
          ],
        ),
      ),
    );
  }
}
