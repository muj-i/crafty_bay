import 'package:crafty_bay/presentation/state_holders/auth/create_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_elevatedbutton.dart';
import 'package:crafty_bay/presentation/ui/widgets/auth/auth_screens_upper_parts.dart';
import 'package:crafty_bay/presentation/ui/widgets/auth/customer_profile_textfields.dart';
import 'package:crafty_bay/presentation/ui/widgets/auth/shipping_profile_textfields.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _customerNameTEController =
      TextEditingController();
  final TextEditingController _customerAddressTEController =
      TextEditingController();
  final TextEditingController _customerCityTEController =
      TextEditingController();
  final TextEditingController _customerStateTEController =
      TextEditingController();
  final TextEditingController _customerPostcodeTEController =
      TextEditingController();
  final TextEditingController _customerCountryTEController =
      TextEditingController();
  final TextEditingController _customerPhoneTEController =
      TextEditingController();
  final TextEditingController _customerFaxTEController =
      TextEditingController();

  final TextEditingController _shippingNameTEController =
      TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final TextEditingController _shippingCityTEController =
      TextEditingController();
  final TextEditingController _shippingStateTEController =
      TextEditingController();
  final TextEditingController _shippingPostcodeTEController =
      TextEditingController();
  final TextEditingController _shippingCountryTEController =
      TextEditingController();
  final TextEditingController _shippingPhoneTEController =
      TextEditingController();

  ReadProfileController readProfileController =
      Get.put(ReadProfileController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (readProfileController.readProfileModel.data != null) {
        _customerNameTEController.text =
            readProfileController.readProfileModel.data?.cusName ?? '';
        _customerAddressTEController.text =
            readProfileController.readProfileModel.data?.cusAdd ?? '';
        _customerCityTEController.text =
            readProfileController.readProfileModel.data?.cusCity ?? '';
        _customerStateTEController.text =
            readProfileController.readProfileModel.data?.cusState ?? '';
        _customerPostcodeTEController.text =
            readProfileController.readProfileModel.data?.cusPostcode ?? '';
        _customerCountryTEController.text =
            readProfileController.readProfileModel.data?.cusCountry ?? '';
        _customerPhoneTEController.text =
            readProfileController.readProfileModel.data?.cusPhone ?? '';
        _customerFaxTEController.text =
            readProfileController.readProfileModel.data?.cusFax ?? '';

        _shippingNameTEController.text =
            readProfileController.readProfileModel.data?.shipName ?? '';
        _shippingAddressTEController.text =
            readProfileController.readProfileModel.data?.shipAdd ?? '';
        _shippingCityTEController.text =
            readProfileController.readProfileModel.data?.shipCity ?? '';
        _shippingStateTEController.text =
            readProfileController.readProfileModel.data?.shipState ?? '';
        _shippingPostcodeTEController.text =
            readProfileController.readProfileModel.data?.shipPostcode ?? '';
        _shippingCountryTEController.text =
            readProfileController.readProfileModel.data?.shipCountry ?? '';
        _shippingPhoneTEController.text =
            readProfileController.readProfileModel.data?.shipPhone ?? '';
        
      }
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
              child: userInfoTextFormFields,
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
        Text(
          'Billing Address',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: 20, color: Colors.grey[800]),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomerProfileTextFields(
            customerNameTEController: _customerNameTEController,
            customerAddressTEController: _customerAddressTEController,
            customerCityTEController: _customerCityTEController,
            customerStateTEController: _customerStateTEController,
            customerPostcodeTEController: _customerPostcodeTEController,
            customerCountryTEController: _customerCountryTEController,
            customerPhoneTEController: _customerPhoneTEController,
            customerFaxTEController: _customerFaxTEController),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Shipping Address',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: 20, color: Colors.grey[800]),
        ),
        const SizedBox(
          height: 10,
        ),
        ShippingProfileTextFields(
            shippingNameTEController: _shippingNameTEController,
            shippingAddressTEController: _shippingAddressTEController,
            shippingCityTEController: _shippingCityTEController,
            shippingStateTEController: _shippingStateTEController,
            shippingPostcodeTEController: _shippingPostcodeTEController,
            shippingCountryTEController: _shippingCountryTEController,
            shippingPhoneTEController: _shippingPhoneTEController),
        const SizedBox(
          height: 20,
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
                    _customerNameTEController.text.trim(),
                    _customerAddressTEController.text.trim(),
                    _customerCityTEController.text.trim(),
                    _customerStateTEController.text.trim(),
                    _customerPostcodeTEController.text.trim(),
                    _customerCountryTEController.text.trim(),
                    _customerPhoneTEController.text.trim(),
                    _customerFaxTEController.text.trim(),
                    _shippingNameTEController.text.trim(),
                    _shippingAddressTEController.text.trim(),
                    _shippingCityTEController.text.trim(),
                    _shippingStateTEController.text.trim(),
                    _shippingPostcodeTEController.text.trim(),
                    _shippingCountryTEController.text.trim(),
                    _shippingPhoneTEController.text.trim(),
                  )
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
