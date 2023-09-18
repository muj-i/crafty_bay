import 'package:crafty_bay/presentation/ui/screens/product_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_details_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_details_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/rating_review_wishbutton_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ProductDetailsCarouselSlider(),
                ProductDetailsAppBar(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Product Name Placeholder',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5),
                        ),
                      ),
                      Text('- 2 +', style: TextStyle(fontSize: 24))
                    ],
                  ),
                  RatingReviewWishButtonRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

