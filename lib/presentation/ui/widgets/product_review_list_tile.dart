import 'package:crafty_bay/data/models/product_review_model.dart';
import 'package:flutter/material.dart';

class ProductReviewListTile extends StatelessWidget {
  final ProductReviewData productReviewData;
  const ProductReviewListTile({
    super.key,
    required this.productReviewData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.grey[600],
                radius: 12,
                child: const Icon(
                  Icons.person_outlined,
                  size: 16,
                )),
            const SizedBox(
              width: 8,
            ),
            Text(productReviewData.profile?.cusName ?? ''),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              productReviewData.description ?? '',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
