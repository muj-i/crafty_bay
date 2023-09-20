import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const AppBarIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onPressed,
      child: CircleAvatar(
        radius: 16,
        backgroundColor:Colors.grey[200],
        child: Icon(
          icon,
          color: Colors.grey,
          size: 22,
        ),
      ),
    );
  }
}
