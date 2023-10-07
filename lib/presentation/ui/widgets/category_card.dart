import 'package:crafty_bay/data/models/categories_model_data.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoriesData categoriesData;
  final VoidCallback onTap;
  const CategoryCard({
    super.key,
    required this.categoriesData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 65,
                width: 65,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: ColorPalette.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  categoriesData.categoryImg ?? '',
                  height: 50,
                )),
            const SizedBox(
              height: 6,
            ),
            Text(
              categoriesData.categoryName ?? '',
              style: const TextStyle(
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
