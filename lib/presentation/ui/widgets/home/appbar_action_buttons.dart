import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/appbar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarActionButtons extends StatelessWidget {
  const AppBarActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarIconButton(
          icon: Icons.person_outlined,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('This is a Snackbar!'),
              ),
            );
          },
        ),const SizedBox(
      width: 12,
    ),
    AppBarIconButton(
      icon: Icons.call_outlined,
      onPressed: () {
        Get.to(const EmailVerificationScreen());
      },
    ),
    const SizedBox(
      width: 12,
    ),
    AppBarIconButton(
      icon: Icons.notifications_active_outlined,
      onPressed: () {},
    ),
    const SizedBox(
      width: 16,
    ),
      ],
    );
  }
}
