import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/create_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_elevatedbutton.dart';
import 'package:crafty_bay/presentation/ui/widgets/auth/auth_screens_upper_parts.dart';
import 'package:crafty_bay/presentation/ui/widgets/auth/complete_screen_shimmer.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/shimmers/products_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({
    super.key,
  });

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();
  ReadProfileController readProfileController =
      Get.put(ReadProfileController());
 bool _isApiFetchingInProgress = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
if (AuthTokenController.isLoggedIn) {
        fetchData().then((value) {
        _firstNameController.text =
            readProfileController.readProfileModel.data?.first.firstName ?? '';
        _lastNameController.text =
            readProfileController.readProfileModel.data?.first.lastName ?? '';
        _mobileController.text =
            readProfileController.readProfileModel.data?.first.mobile ?? '';
        _cityController.text =
            readProfileController.readProfileModel.data?.first.city ?? '';
        _shippingAddressController.text = readProfileController
                .readProfileModel.data?.first.shippingAddress ??
            '';
      });
      } else {
        Get.offAll(() => const EmailVerificationScreen());
      }

      
    });
  }

  Future<void> fetchData() async {
    setState(() {
      _isApiFetchingInProgress = true;
    });
    await readProfileController.readProfileData();
    setState(() {
      _isApiFetchingInProgress = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child:_isApiFetchingInProgress == false
                  ? const Center(child: CompleteScreenShimmer())
                  : userInfoTextFormFields,
            ),
          ),
        ),
      ),
    );
  }

  Column get userInfoTextFormFields {
    return Column(
      children: [
        const AuthScreensUpperParts(
          title: 'Complete Profile',
          subTitle: 'Get started wiyh us with your details',
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
          controller: _mobileController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
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
          textInputAction: TextInputAction.done,
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
        GetBuilder<CreateProfileController>(
          builder: (createProfileController) {
            if (createProfileController.createProfileInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return AllOverElevatedButton(
              buttonName: 'Complete',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  createProfileController
                      .createProfileData(
                          _firstNameController.text.trim(),
                          _lastNameController.text.trim(),
                          _mobileController.text.trim(),
                          _cityController.text.trim(),
                          _shippingAddressController.text.trim())
                      .then(
                    (result) {
                      if (result) {
                        Get.snackbar(
                          'Thank you for completing profile! ツ',
                          'Profile updated successfully',
                          backgroundColor: Colors.green.withOpacity(.2),
                          snackPosition: SnackPosition.TOP,
                        );
                        Get.offAll(() => const BottomNavBaseScreen());
                      } else {
                        Get.snackbar('Opps! :(', 'Profile update failed',
                            backgroundColor: Colors.red.withOpacity(.2),
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
