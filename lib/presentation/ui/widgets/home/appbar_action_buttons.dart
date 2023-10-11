import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/home_icon_button.dart';
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
        HomeIconButton(
          icon: Icons.person_outlined,
          onPressed: () {
            AuthTokenController.clear();
          },
        ),
        const SizedBox(
          width: 12,
        ),
        HomeIconButton(
          icon: Icons.call_outlined,
          onPressed: () {
            // Get.to(const EmailVerificationScreen());
          },
        ),
        const SizedBox(
          width: 12,
        ),
        HomeIconButton(
          icon: Icons.notifications_active_outlined,
          onPressed: () {
            Get.snackbar(
              'Happy Shopping! ツ',
              'This is your friend CraftyBay!',
              backgroundColor: Colors.green.withOpacity(.2),
              snackPosition: SnackPosition.TOP,
            );
          },
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
