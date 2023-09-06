import 'package:crafty_bay/presentation/ui/utils/image_paths.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          ImagePaths.craftyBayLogoNavSVG,
          width: 115,
        ),
        actions: [
          AppBarIconButton(
            icon: Icons.person_outlined,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This is a Snackbar!'),
                ),
              );
            },
          ),
          const SizedBox(
            width: 8,
          ),
          AppBarIconButton(
            icon: Icons.phone_outlined,
            onPressed: () {},
          ),
          const SizedBox(
            width: 8,
          ),
          AppBarIconButton(
            icon: Icons.notifications_active_outlined,
            onPressed: () {},
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
