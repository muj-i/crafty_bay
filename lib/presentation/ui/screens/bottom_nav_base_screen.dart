import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesListScreen(),
    CartScreen(),
    WishScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBaseController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedIndex,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            showUnselectedLabels: true,
            selectedItemColor: ColorPalette.primaryColor,
            onTap: controller.changeScreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.house,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard_rounded,
                    size: 25,
                  ),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.basketShopping), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.gift), label: 'Wish'),
            ],
          ),
        );
      },
    );
  }
}
