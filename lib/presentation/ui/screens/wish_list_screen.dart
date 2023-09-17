import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
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
          title: Text('Wish List', style: appBarStyle),
          leading: IconButton(
            color: iconColor,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.find<BottomNavBaseController>().backRoHome();
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
                    icon: FontAwesomeIcons.trashCan,
                  ));
            },
          ),
        ),
      ),
    );
  }
}
