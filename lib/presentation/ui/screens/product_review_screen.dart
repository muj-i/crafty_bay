import 'package:crafty_bay/presentation/ui/screens/add_product_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_review_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AllOverAppBar(
          pageTitle: "Reviews",
          backButton: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ProductReviewListTile();
                  },
                ),
              ),
            ),
          ),
          BottomContainerButton(
            title: 'Reviews',
            subTitle: '1,000',
            button: FloatingActionButton(
                backgroundColor: ColorPalette.primaryColor,
                onPressed: () {
                  Get.to(() => const AddProductReviewScreen());
                },
                child: const Icon(Icons.add)),
          ),
        ],
      ),
    );
  }
}
