import 'dart:async';

import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();

  int _secondsRemaining = 10;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) {
        if (_secondsRemaining == 0) {
          timer.cancel();
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  void resetTimer() {
    setState(() {
      _secondsRemaining = 10;
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                'Enter OTP Code',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 28, color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'A 4 digit OTP code has been sent',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(
                height: 16,
              ),
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    Get.offAll(() => const CompleteProfileScreen());
                  },
                  child: const Text('Next'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_secondsRemaining > 0)
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(text: 'This code will expire in '),
                          TextSpan(
                            text:
                                '${_secondsRemaining}s', // Pluralize "second" if needed
                            style: const TextStyle(
                              color: ColorPalette.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (_secondsRemaining == 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Code has expired',
                            style: TextStyle(color: Colors.grey)),
                        TextButton(
                          onPressed: () {
                            resetTimer();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: ColorPalette.primaryColor,
                          ),
                          child: const Text('Resend Code'),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
