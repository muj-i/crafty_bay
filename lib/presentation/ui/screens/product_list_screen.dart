import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: appBackgroundColor,
        title: Text('prefered catagories', style: appBarStyle),
        leading: IconButton(
          color: iconColor,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            // Get.back();
            Get.offAll(() => const BottomNavBaseScreen());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 32,
          ),
          itemBuilder: (context, index) {
            return const FittedBox(
                fit: BoxFit.cover,
                child: ProductCard(
                  icon: Icons.favorite_border_rounded,
                ));
          },
        ),
      ),
    );
  }
}
