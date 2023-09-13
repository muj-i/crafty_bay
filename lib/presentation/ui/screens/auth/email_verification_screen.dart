import 'package:crafty_bay/presentation/ui/screens/auth/pin_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
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
                'Welcome Back',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 28, color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Please Enter Your Email Address',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Email Address',
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter your email address";
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                      .hasMatch(value!)) {
                    return "Enter a valid email address";
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

                        Get.offAll(() => const PinVerificationScreen());
                      },
                      child: const Text('Next')))
            ],
          ),
        ),
      ),
    );
  }
}
