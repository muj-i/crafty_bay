import 'package:flutter/material.dart';

class HomeIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const HomeIconButton({
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
        backgroundColor: Colors.grey[200],
        child: Icon(
          icon,
          color: Colors.grey,
          size: 22,
        ),
      ),
    );
  }
}
