import 'package:crafty_bay/presentation/ui/utils/constraints.dart';
import 'package:flutter/material.dart';

class AllOverAppBar extends StatelessWidget {
  final String pageTitle;
  final VoidCallback backButton;
  const AllOverAppBar(
      {super.key, required this.pageTitle, required this.backButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: appBackgroundColor,
      title: Text(pageTitle, style: appBarStyle),
      leading: IconButton(
        color: iconColor,
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: backButton,
      ),
    );
  }
}
