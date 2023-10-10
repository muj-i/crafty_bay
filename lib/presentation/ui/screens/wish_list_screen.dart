import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/wish_list_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.find<WishListController>().getCartList();
    // });
  }

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
          pageTitle: "Wish List",
          backButton: () {
            Get.find<BottomNavBaseController>().backToHome();
          },
        ),
        body: GetBuilder<WishListController>(builder: (wishListController) {
          if (wishListController.getWishListInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (wishListController.wishListModel.data == null ||
              wishListController.wishListModel.data!.isEmpty) {
            return const Center(
              child: Text('No products in the wish list'),
            );
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            child: GridView.builder(
              itemCount: wishListController.wishListModel.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 32,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  fit: BoxFit.cover,
                  child: WishListProductCard(
                    onPressed: () {},
                    wishData: wishListController.wishListModel.data![index],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
