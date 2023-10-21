import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShippingProfileTextFields extends StatelessWidget {
  const ShippingProfileTextFields({
    super.key,
    required this.shippingNameTEController,
    required this.shippingAddressTEController,
    required this.shippingCityTEController,
    required this.shippingStateTEController,
    required this.shippingPostcodeTEController,
    required this.shippingCountryTEController,
    required this.shippingPhoneTEController,
  });
  final TextEditingController shippingNameTEController;
  final TextEditingController shippingAddressTEController;
  final TextEditingController shippingCityTEController;
  final TextEditingController shippingStateTEController;
  final TextEditingController shippingPostcodeTEController;
  final TextEditingController shippingCountryTEController;
  final TextEditingController shippingPhoneTEController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: shippingNameTEController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Full Name',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "Enter your full name";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: shippingAddressTEController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Address',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "Enter your address";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: shippingCityTEController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'City',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "Enter your city";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: shippingStateTEController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'State',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "Enter your state";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: shippingPostcodeTEController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Postcode',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "Enter your postcode";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: shippingCountryTEController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Country',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "Enter your country";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: shippingPhoneTEController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
          decoration: const InputDecoration(
            hintText: 'Phone',
          ),
          validator: (String? value) {
            if ((value?.isEmpty ?? true) || value!.length < 11) {
              return "Enter your 11 digit phone number";
            }
            final RegExp mobileRegex = RegExp(r'^01[0-9]{9}$');
            if (!mobileRegex.hasMatch(value)) {
              return "Enter a valid phone number";
            }
            return null;
          },
        ),
      ],
    );
  }
}
