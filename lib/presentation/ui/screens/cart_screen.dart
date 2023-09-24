import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart_product_card.dart';
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const CartProductCard();
                },
              ),
            ),
            BottomContainer(
              padding: const EdgeInsets.symmetric(vertical: 21,horizontal: 17),
              title: 'Total Price',
              subTitle: '\$100,000.00',
              button: BottomContainerButton(
                text: 'Checkout',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
