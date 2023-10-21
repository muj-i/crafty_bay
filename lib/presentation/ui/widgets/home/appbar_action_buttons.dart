import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
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
          onPressed: () async {
            await Get.find<ReadProfileController>().readProfileData();
            if (AuthTokenController.isLoggedIn) {
              Get.to(const CompleteProfileScreen());
            } else {
              Get.to(const EmailVerificationScreen());
            }
          },
        ),
        const SizedBox(
          width: 12,
        ),
        HomeIconButton(
          icon: Icons.call_outlined,
          onPressed: () {},
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
          width: 12,
        ),
        HomeIconButton(
          icon: Icons.logout_rounded,
          onPressed: () {
            Get.defaultDialog(
              middleText: "Do you want to log out?",
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: ()  {
                         AuthTokenController.clear();
                         AuthTokenController.getAccessToken();
                        Get.back();
                        if (AuthTokenController.isLoggedIn) {
                          Get.snackbar(
                            'Log out done',
                            'See you soon!',
                            backgroundColor: Colors.green.withOpacity(.2),
                            snackPosition: SnackPosition.TOP,
                          );
                        } else {
                          Get.snackbar(
                            'Already Loged out',
                            'You need to log in before logging out',
                            backgroundColor: Colors.red.withOpacity(.2),
                            snackPosition: SnackPosition.TOP,
                          );
                        }
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
              ],
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
