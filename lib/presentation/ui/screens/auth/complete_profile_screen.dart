import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Center(
                    child: SvgPicture.asset(
                  AppImageAssets.craftyBayLogoSVG,
                  width: 120,
                )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 28, color: Colors.grey[800]),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Get started wiyh us with your details',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _firstNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your first name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your last name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _mobileNumberController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only allow digits
                    LengthLimitingTextInputFormatter(11), // Limit the length
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  ),
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) || value!.length < 11) {
                      return "Enter your 11 digit mobile number";
                    }
                    final RegExp mobileRegex = RegExp(r'^01[0-9]{9}$');
                    if (!mobileRegex.hasMatch(value)) {
                      return "Enter a valid mobile number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cityController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'City',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your city name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  maxLines: 4,
                  controller: _shippingAddressController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your shipping address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      Get.offAll(() => const HomeScreen());
                    },
                    child: const Text('Complete'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
