import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/image_paths.dart';
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
        () => const EmailVerificationScreen(), //HomeScreen(),
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
              ImagePaths.craftyBayLogoSVG,
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
