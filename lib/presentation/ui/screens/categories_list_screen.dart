import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
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
        Get.find<BottomNavBaseController>().backRoHome();
        return false;
      },
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: appBackgroundColor,
          title: Text('Categories', style: appBarStyle),
          leading: IconButton(
            color: iconColor,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.find<BottomNavBaseController>().backRoHome();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: GridView.builder(
            itemCount: 16,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(
                child: CategoryCard(),
              );
            },
          ),
        ),
      ),
    );
  }
}
