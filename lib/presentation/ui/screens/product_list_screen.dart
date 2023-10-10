import 'package:crafty_bay/data/models/product_data.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  final List<ProductData> productData;
  final String appBarRemark;
  const ProductListScreen(
      {super.key, required this.productData, required this.appBarRemark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AllOverAppBar(
        pageTitle: appBarRemark,
        backButton: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: GridView.builder(
          itemCount: productData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 32,
          ),
          itemBuilder: (context, index) {
            return FittedBox(
              fit: BoxFit.cover,
              child: ProductCard(
                productData: productData[index],
                onPressed: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
