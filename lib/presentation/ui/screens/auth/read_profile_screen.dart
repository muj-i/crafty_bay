import 'dart:developer';

import 'package:crafty_bay/data/models/read_profile_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReadProfileScreen extends StatefulWidget {
  const ReadProfileScreen({super.key});

  @override
  State<ReadProfileScreen> createState() => _ReadProfileScreenState();
}

class _ReadProfileScreenState extends State<ReadProfileScreen> {
  ReadProfileModel readProfileModel = ReadProfileModel();
  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   log('Read profile');
    //   await AuthTokenController.getAccessToken();
    //   await Get.find<ReadProfileController>().readProfileData();
    // 
  await  fetchBooks();});
    super.initState();
  }

  Future<void> fetchBooks() async {
    final token = AuthTokenController.accessToken.toString();
    // const String token = ;
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMxLCJpc19hZG1pbiI6ZmFsc2UsImV4cCI6MTY5NDQ2OTgwOX0.MYfKh28YxoPEegcsjjFUwPOJdRVyL-cpkHe5Ewo_j44'; // Replace with your authentication token

    final response = await http.get(
      Uri.parse('https://craftybay.teamrabbil.com/api/ReadProfile'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      setState(() {});
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed')));
      }
    }
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

