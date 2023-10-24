import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<BottomNavBaseController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AllOverAppBar(
            pageTitle: 'Cart',
            backButton: () {
              Get.find<BottomNavBaseController>().backToHome();
            }),
        body: GetBuilder<CartListController>(builder: (cartListController) {
          if (cartListController.getCartListInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (cartListController.cartListModel.data == null ||
              cartListController.cartListModel.data!.isEmpty) {
            return const Center(
              child: Text('No products in the cart list'),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await cartListController.getCartList();
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        cartListController.cartListModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CartProductCard(
                        cartData: cartListController.cartListModel.data![index],
                      );
                    },
                  ),
                ),
                BottomContainer(
                  padding:
                      const EdgeInsets.symmetric(vertical: 21, horizontal: 17),
                  title: 'Total Price',
                  subTitle: '\$100,000.00',
                  button: BottomContainerButton(
                    text: 'Checkout',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
