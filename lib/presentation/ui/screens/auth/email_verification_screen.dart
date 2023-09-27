import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/pin_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/custom_sncakbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_elevatedbutton.dart';
import 'package:crafty_bay/presentation/ui/widgets/auth/auth_screens_upper_parts.dart';
import 'package:flutter/material.dart';
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
          child: userEmailTextFormField,
        ),
      ),
    );
  }

  Column get userEmailTextFormField {
    return Column(
      children: [
        const AuthScreensUpperParts(
            title: 'Welcome Back', subTitle: 'Please Enter Your Email Address'),
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
            // else if (value!.isEmail == false) {
            //   return "Enter a valid email address";
            // }
            else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                .hasMatch(value!)) {
              return "Enter a valid email address";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<EmailVerificationController>(builder: (controller) {
          if (controller.emailVerificationInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          return AllOverElevatedButton(
            buttonName: 'Next',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                verifyEmail(controller);
              }
            },
          );
        }),
      ],
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response = await controller.verifyEmail(_emailController.text.trim());
    if (response) {
      Get.to(() => const PinVerificationScreen());
    } else {
      if (mounted) {
        CustomSnackbar.show(
            context: context, message: 'Email verification failed! Try again');
      }
    }
  }
}
