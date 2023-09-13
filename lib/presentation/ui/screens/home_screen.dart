import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:crafty_bay/presentation/ui/widgets/appbar_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_search_field.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_header.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          AppImageAssets.craftyBayLogoNavSVG,
          width: 115,
        ),
        actions: [
          AppBarIconButton(
            icon: Icons.person_outlined,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This is a Snackbar!'),
                ),
              );
            },
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIconButton(
            icon: Icons.call_outlined,
            onPressed: () {
              Get.to(const EmailVerificationScreen());
            },
          ),
          const SizedBox(
            width: 12,
          ),
          AppBarIconButton(
            icon: Icons.notifications_active_outlined,
            onPressed: () {},
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const HomeSearchField(),
              const SizedBox(
                height: 16,
              ),
              const HomeCarouselSlider(),
              SectionHeader(
                title: 'All Categories',
                onTap: () {},
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  itemCount: 10,
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
                onTap: () {},
              ),
              SizedBox(
                height: 155,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {},
              ),
              SizedBox(
                height: 155,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ),
              SectionHeader(
                title: 'New',
                onTap: () {},
              ),
              SizedBox(
                height: 155,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
