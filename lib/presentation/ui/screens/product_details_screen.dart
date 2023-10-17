import 'dart:developer';

import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_color_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_details_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_details_shimmer.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_size_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/rating_review_wishbutton_row.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  void initState() {
    super.initState();
    //  WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    //  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.getProductDetailsDataInProgress) {
          return const ProductDetailsShimmer();
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ProductDetailsCarouselSlider(
                            imageList: [
                              productDetailsController
                                      .productDetailsData.img1 ??
                                  '',
                              productDetailsController
                                      .productDetailsData.img2 ??
                                  '',
                              productDetailsController
                                      .productDetailsData.img3 ??
                                  '',
                              productDetailsController
                                      .productDetailsData.img4 ??
                                  ''
                            ],
                          ),
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
                      productDetails(productDetailsController,
                          productDetailsController.availableColors),
                    ],
                  ),
                ),
              ),
              BottomContainer(
                title: 'Price',
                subTitle:
                    '৳${productDetailsController.productDetailsData.product!.price ?? ''}',
                button: GetBuilder<AddToCartController>(
                  builder: (addToCartController) {
                    if (addToCartController.addToCartInProgress) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return BottomContainerButton(
                      text: 'Add To Cart',
                      onPressed: () async {
                        final result = await addToCartController.addToCart(
                          productDetailsController.productDetailsData.id!,
                          productDetailsController
                              .colorCode[_selectedColorIndex]
                              .toString(),
                          productDetailsController
                              .availableSizes[_selectedSizeIndex],
                        );
                        if (result) {
                          Get.snackbar(
                            'Happy Shopping! ツ',
                            'This product has been added to cart list',
                            backgroundColor: Colors.green.withOpacity(.2),
                            snackPosition: SnackPosition.TOP,
                          );
                        } else {
                          Get.snackbar(
                            'Product cannot be added to cart',
                            'You need to complete your profile before shopping.\nIf you didn\'t complete your profile when logging in.\nYou can complete by naviagting to the profile screen from the home page',
                            backgroundColor: Colors.redAccent.withOpacity(.2),
                            snackPosition: SnackPosition.TOP,
                            duration: const Duration(seconds: 15),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Padding productDetails(
      ProductDetailsController productDetailsController, List<Color> colors) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetailsController.productDetailsData.product!.title ??
                      '',
                  style: const TextStyle(
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
                    log(newValue.toString());
                  })
            ],
          ),
          RatingReviewWishButtonRow(
            productDetailsData: productDetailsController.productDetailsData,
          ),
          ProductColorPicker(
            colors: productDetailsController.availableColors,
            onSelected: (int selectedColor) {
              log(selectedColor.toString());

              _selectedColorIndex = selectedColor;

              log(_selectedColorIndex.toString());
              log(productDetailsController.availableColors[_selectedColorIndex]
                  .toString());
            },
            initialSelectedColor: 0,
          ),
          const SizedBox(
            height: 12,
          ),
          ProductSizePicker(
            sizes: productDetailsController.availableSizes,
            onSelected: (int selectedSize) {
              _selectedSizeIndex = selectedSize;

              log(selectedSize.toString());
              log(_selectedSizeIndex.toString());
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
            productDetailsController.productDetailsData.des ?? '',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
