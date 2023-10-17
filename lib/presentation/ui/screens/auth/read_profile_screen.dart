import 'package:crafty_bay/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadProfileScreen extends StatefulWidget {
  const ReadProfileScreen({super.key});

  @override
  State<ReadProfileScreen> createState() => _ReadProfileScreenState();
}

class _ReadProfileScreenState extends State<ReadProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3)).then(
          (value) async => Get.find<ReadProfileController>().readProfileData());

      Get.find<ReadProfileController>().readProfileModel.data?.length == 1
          ? Get.offAll(() => const BottomNavBaseScreen())
          : Get.offAll(() => const CompleteProfileScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
