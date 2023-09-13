import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHomepage();
  }

  void goToHomepage() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => Get.offAll(
        () => const BottomNavBaseScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              AppImageAssets.craftyBayLogoSVG,
              width: 163,
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          const Text('Version 1.0.0'),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
