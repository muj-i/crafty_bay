import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<BottomNavBaseController>().backRoHome();
        return false;
      },
      child: Scaffold(
        appBar: AllOverAppBar(
            pageTitle: 'Cart',
            backButton: () {
              Get.find<BottomNavBaseController>().backRoHome();
            }),
        body: const Center(child: Text('Cart Screen')),
      ),
    );
  }
}
