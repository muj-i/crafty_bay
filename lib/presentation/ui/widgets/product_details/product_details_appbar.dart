import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Product Details',
        style: TextStyle(color: Colors.black87),
      ),
      leading: IconButton(
        icon:
            const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}