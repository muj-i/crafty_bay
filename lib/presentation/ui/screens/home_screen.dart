import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/appbar_action_buttons.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_search_field.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_header.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBackgroundColor,
        title: SvgPicture.asset(
          AppImageAssets.craftyBayLogoNavSVG,
          width: 115,
        ),
        actions: const [
          AppBarActionButtons(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: homeScreenContents,
        ),
      ),
    );
  }

  Column get homeScreenContents {
    return Column(
      children: [
        const HomeSearchField(),
        const SizedBox(
          height: 16,
        ),
        const HomeCarouselSlider(),
        SectionHeader(
          title: 'All Categories',
          onTap: () {
            Get.find<BottomNavBaseController>().changeScreen(1);
          },
        ),
        SizedBox(
          height: 90,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CategoryCard();
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SectionHeader(
          title: 'Popular',
          onTap: () {
            Get.to(() => const ProductListScreen());
          },
        ),
        SizedBox(
          height: 155,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const ProductCard(
                icon: Icons.favorite_border_rounded,
              );
            },
          ),
        ),
        SectionHeader(
          title: 'Special',
          onTap: () {
            Get.to(() => const ProductListScreen());
          },
        ),
        SizedBox(
          height: 155,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const ProductCard(
                icon: Icons.favorite_border_rounded,
              );
            },
          ),
        ),
        SectionHeader(
          title: 'New',
          onTap: () {
            Get.to(() => const ProductListScreen());
          },
        ),
        SizedBox(
          height: 155,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const ProductCard(
                icon: Icons.favorite_border_rounded,
              );
            },
          ),
        ),
      ],
    );
  }
}
