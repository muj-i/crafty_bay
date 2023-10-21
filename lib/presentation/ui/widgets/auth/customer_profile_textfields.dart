import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerProfileTextFields extends StatelessWidget {
  const CustomerProfileTextFields(
      {super.key,
      required this.customerNameTEController,
      required this.customerAddressTEController,
      required this.customerCityTEController,
      required this.customerStateTEController,
      required this.customerPostcodeTEController,
      required this.customerCountryTEController,
      required this.customerPhoneTEController,
      required this.customerFaxTEController});
  final TextEditingController customerNameTEController;
  final TextEditingController customerAddressTEController;
  final TextEditingController customerCityTEController;
  final TextEditingController customerStateTEController;
  final TextEditingController customerPostcodeTEController;
  final TextEditingController customerCountryTEController;
  final TextEditingController customerPhoneTEController;
  final TextEditingController customerFaxTEController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: customerNameTEController,
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
          controller: customerAddressTEController,
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
          controller: customerCityTEController,
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
          controller: customerStateTEController,
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
          controller: customerPostcodeTEController,
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
          controller: customerCountryTEController,
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
          controller: customerPhoneTEController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
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
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: customerFaxTEController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
          decoration: const InputDecoration(
            hintText: 'Fax',
          ),
          validator: (String? value) {
            if ((value?.isEmpty ?? true) || value!.length < 11) {
              return "Enter your 11 digit fax number";
            }
            final RegExp mobileRegex = RegExp(r'^01[0-9]{9}$');
            if (!mobileRegex.hasMatch(value)) {
              return "Enter a valid fax number";
            }
            return null;
          },
        ),
      ],
    );
  }
}
