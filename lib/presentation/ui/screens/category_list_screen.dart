import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/category_product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<BottomNavBaseController>().backToHome();
        return false;
      },
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AllOverAppBar(
          pageTitle: 'Categories',
          backButton: () {
            Get.find<BottomNavBaseController>().backToHome();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child:
              GetBuilder<CategoryController>(builder: (categoriesController) {
            return GridView.builder(
              itemCount: categoriesController.categoriesModel.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  child: CategoryCard(
                    categoriesData:
                        categoriesController.categoriesModel.data![index],
                    onTap: () {
                      Get.to(
                        CategoriesProductListScreen(
                          categoryId: categoriesController
                              .categoriesModel.data![index].id,
                          appBarRemark: categoriesController
                                  .categoriesModel.data![index].categoryName ??
                              '',
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
