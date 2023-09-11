import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
   int _selectedScreenIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishScreen()
  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed, 
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey
        ),
        showUnselectedLabels: true,
        selectedItemColor: ColorPalette.primaryColor,
        onTap: (int index) {
          _selectedScreenIndex = index;
     
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.tableCellsLarge), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.basketShopping), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.gift), label: 'Wish'),
        ],
      ),
    );
  }
}