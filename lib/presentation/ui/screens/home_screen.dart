import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/category_product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/appbar_action_buttons.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_search_field.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_header.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/shimmers/categories_shimmer.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/shimmers/home_slider_shimmer.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/shimmers/products_shimmer.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset(
          AppImageAssets.craftyBayLogoNavSVG,
          width: 115,
        ),
        actions: const [
          AppBarActionButtons(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: homeScreenContents,
        ),
      ),
    );
  }

  Column get homeScreenContents {
    return Column(
      children: [
        const HomeSearchField(),
        const SizedBox(
          height: 16,
        ),
        GetBuilder<HomeSliderController>(builder: (homeSliderController) {
          return Visibility(
            visible: homeSliderController.getHomeSlidersInProgress == false,
            replacement: const Center(child: HomeSliderShimmer()),
            child: HomeCarouselSlider(
              sliders: homeSliderController.sliderModel.data ?? [],
            ),
          );
        }),
        GetBuilder<CategoryController>(builder: (categoriesController) {
          return Visibility(
            visible: categoriesController.getCategoriesInProgress == false,
            replacement: const Center(
              child: CategoriesShimmer(),
            ),
            child: Column(
              children: [
                SectionHeader(
                  title: 'All Categories',
                  onTap: () {
                    Get.find<BottomNavBaseController>().changeScreen(1);
                  },
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount:
                        categoriesController.categoriesModel.data?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        categoriesData:
                            categoriesController.categoriesModel.data![index],
                        onTap: () {
                          Get.to(
                            CategoriesProductListScreen(
                              categoryId: categoriesController
                                  .categoriesModel.data![index].id,
                              appBarRemark: categoriesController.categoriesModel
                                      .data![index].categoryName ??
                                  '',
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
        const SizedBox(
          height: 8,
        ),
        GetBuilder<PopularProductController>(
            builder: (popularProductController) {
          return Visibility(
            visible:
                popularProductController.getPopularProductsInProgress == false,
            replacement: const Center(
              child: ProductsShimmer(),
            ),
            child: Column(
              children: [
                SectionHeader(
                  title: 'Popular',
                  onTap: () {
                    Get.to(
                      () => ProductListScreen(
                        productData: Get.find<PopularProductController>()
                                .popularProductModel
                                .data ??
                            [],
                        appBarRemark: 'Popular Product',
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    itemCount: popularProductController
                            .popularProductModel.data?.length ??
                        0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        productData: popularProductController
                            .popularProductModel.data![index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
        GetBuilder<SpecialProductController>(
            builder: (specialProductController) {
          return Visibility(
            visible:
                specialProductController.getSpecialProductsInProgress == false,
            replacement: const Center(
              child: ProductsShimmer(),
            ),
            child: Column(
              children: [
                SectionHeader(
                  title: 'Special',
                  onTap: () {
                    Get.to(
                      () => ProductListScreen(
                        productData: Get.find<SpecialProductController>()
                                .specialProductModel
                                .data ??
                            [],
                        appBarRemark: 'Special Product',
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    itemCount: specialProductController
                            .specialProductModel.data?.length ??
                        0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        productData: specialProductController
                            .specialProductModel.data![index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
        GetBuilder<NewProductController>(builder: (newProductController) {
          return Visibility(
            visible: newProductController.getNewProductsInProgress == false,
            replacement: const Center(
              child: ProductsShimmer(),
            ),
            child: Column(
              children: [
                SectionHeader(
                  title: 'New',
                  onTap: () {
                    Get.to(
                      () => ProductListScreen(
                        productData: Get.find<NewProductController>()
                                .newProductModel
                                .data ??
                            [],
                        appBarRemark: 'New Product',
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    itemCount:
                        newProductController.newProductModel.data?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        productData:
                            newProductController.newProductModel.data![index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
