import 'dart:developer';

import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/read_profile_controller.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      log('Read profile');
      await AuthTokenController.getAccessToken();
      await Get.find<ReadProfileController>().readProfileData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ReadProfileController>(builder: (readProfileController) {
        if (readProfileController.readProfileInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          height: 100,
          width: 100,
          color: Colors.red,
        );
      }),
    );
  }
}
