import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ElectronicsCategoriesScreen extends StatefulWidget {
  const ElectronicsCategoriesScreen({super.key});

  @override
  State<ElectronicsCategoriesScreen> createState() => _ElectronicsCategoriesScreenState();
}

class _ElectronicsCategoriesScreenState extends State<ElectronicsCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: appBackgroundColor,
        title: Text('Electronics', style: appBarStyle),
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
