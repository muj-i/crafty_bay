import 'package:flutter/material.dart';

class SectionTittle extends StatelessWidget {
  final String title;
  const SectionTittle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}