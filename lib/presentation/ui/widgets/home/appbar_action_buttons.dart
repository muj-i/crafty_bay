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
            Get.snackbar(
              'Happy Shopping! ツ',
              'This is your friend CraftyBay!',
              backgroundColor: Colors.green.withOpacity(.2),
              snackPosition: SnackPosition.TOP,
            );
          },
        ),
        const SizedBox(
          width: 12,
        ),
        AppBarIconButton(
          icon: Icons.call_outlined,
          onPressed: () {
            // Get.to(const EmailVerificationScreen());
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
