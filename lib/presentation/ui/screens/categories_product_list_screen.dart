import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holders/categories_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesProductListScreen extends StatefulWidget {
  final int? categoryId;
  final ProductModel? productModel;
  final String appBarRemark;
  const CategoriesProductListScreen({
    super.key,
    this.productModel,
    required this.appBarRemark,
    this.categoryId,
  });

  @override
  State<CategoriesProductListScreen> createState() =>
      _CategoriesProductListScreenState();
}

class _CategoriesProductListScreenState
    extends State<CategoriesProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.categoryId != null) {
        Get.find<CategoryProductListController>()
            .getProductsByCategory(widget.categoryId!);
      } else if (widget.productModel != null) {
        Get.find<CategoryProductListController>()
            .setProducts(widget.productModel!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AllOverAppBar(
        pageTitle: widget.appBarRemark,
        backButton: () {
          Get.back();
        },
      ),
      body: GetBuilder<CategoryProductListController>(builder: (controller) {
        if (controller.getCategoryProductsListInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.productModel.data?.isEmpty ?? true) {
          return const Center(
            child: Text('Empty list'),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: GridView.builder(
            itemCount: controller.productModel.data?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return FittedBox(
                fit: BoxFit.cover,
                child: ProductCard(
                  icon: Icons.favorite_border_rounded,
                  productData: controller.productModel.data![index],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
