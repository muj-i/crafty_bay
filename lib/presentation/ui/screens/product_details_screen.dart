import 'dart:math';

import 'package:crafty_bay/presentation/ui/screens/product_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_color_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_details_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_size_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    Colors.black,
    ColorPalette.primaryColor,
    Colors.brown,
    Colors.grey.shade500,
    Colors.grey.shade700,
  ];

  List<String> sizes = [
    'X',
    'XL',
    '2L',
    'X',
  ];
  //!!!!!!!!
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const ProductDetailsCarouselSlider(),
                        AllOverAppBar(
                          pageTitle: 'Product Details',
                          backButton: () {
                            Get.back();
                          },
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        )
                      ],
                    ),
                    productDetails,
                  ],
                ),
              ),
            ),
            BottomContainer(
              title: 'Price',
              subTitle: '\$1,000',
              button: BottomContainerButton(
                text: 'Add To Cart',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding get productDetails {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Product Name Placeholder',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5),
                ),
              ),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newValue) {
                    log(newValue);
                  })
            ],
          ),
          Row(
            children: [
              Wrap(
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber,
                  ),
                  Text(
                    '4.8',
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
                  Get.to(() => const ProductReviewScreen());
                },
                child: const Text(
                  'Reviews',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Card(
                color: ColorPalette.primaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          ProductColorPicker(
            colors: colors,
            onSelected: (int selectedColor) {
              //!!!!!!!!
              _selectedColorIndex = selectedColor;
            },
            initialSelectedColor: 0,
          ),
          const SizedBox(
            height: 12,
          ),
          ProductSizePicker(
            sizes: sizes,
            onSelected: (int selectedSize) {
              //!!!!!!!!
              _selectedSizeIndex = selectedSize;
            },
            initialSelectedSize: 0,
          ),
          const SizedBox(
            height: 16,
          ),
          const SectionTittle(title: 'Description'),
          const SizedBox(
            height: 12,
          ),
          Text(
            '''Lorem IpsumfrfrfrfrfrfrfrfrfrfrfIpsumfrfrfrfrfrfrfrfrfrfrfIpsumfrfrfrfrfrfrfrfrfrfrfIpsumfrfrfrfrfrfrfrfrfrfrfIpsumfrfrfrfrfrfrfrfrfrfrfIpsumfrfrfrfrfrfrfrfrfrfrf is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                                  ''',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
