import 'package:crafty_bay/presentation/state_holders/pin_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/utils/custom_sncakbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_elevatedbutton.dart';
import 'package:crafty_bay/presentation/ui/widgets/auth/auth_screens_upper_parts.dart';
import 'package:crafty_bay/presentation/ui/widgets/auth/otp_expiry_counter_and_resend_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  final String email;
  const PinVerificationScreen({super.key, required this.email});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: otpTextFromField(context),
        ),
      ),
    );
  }

  SingleChildScrollView otpTextFromField(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AuthScreensUpperParts(
              title: 'Enter OTP Code',
              subTitle: 'A 4 digit OTP code has been sent'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: PinCodeTextField(
              controller: _pinController,
              length: 4,
              obscureText: false,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeColor: ColorPalette.primaryColor,
                  activeFillColor: Colors.white,
                  inactiveColor: ColorPalette.primaryColor,
                  inactiveFillColor: Colors.white,
                  selectedColor: ColorPalette.primaryColor,
                  selectedFillColor: Colors.white,
                  errorBorderColor: Colors.redAccent),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter the OTP sent to your email";
                }
                return null;
              },
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onCompleted: (v) {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                return false;
              },
              appContext: context,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<PinVerificationController>(
              builder: (pinVerificationController) {
                if(pinVerificationController.pinVerificationInProgress){
                  return Center(child: CircularProgressIndicator());
                }
            return AllOverElevatedButton(
              buttonName: 'Next',
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                verifyPin(pinVerificationController);
              },
            );
          }),
          const OtpExpiryCounterAndResendButton(),
        ],
      ),
    );
  }

  Future<void> verifyPin(
      PinVerificationController pinVerificationController) async {
    final response = await pinVerificationController.verifyPin(
        widget.email, _pinController.text.trim());
    if (response) {
      //!
       Get.offAll(() => const BottomNavBaseScreen());
      //Get.to(() => const PinVerificationScreen());  Get.offAll(() => const CompleteProfileScreen());
    } else {
      if (mounted) {
        CustomSnackbar.show(
            context: context, message: 'Otp verification failed! Try again');
      }
    }
  }
}
