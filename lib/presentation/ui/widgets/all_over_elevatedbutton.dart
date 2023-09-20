import 'package:flutter/material.dart';

class AllOverElevatedButton extends StatelessWidget {
  const AllOverElevatedButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonName),
      ),
    );
  }
}