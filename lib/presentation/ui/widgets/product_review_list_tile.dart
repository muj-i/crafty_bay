import 'package:flutter/material.dart';

class ProductReviewListTile extends StatefulWidget {
  const ProductReviewListTile({
    super.key,
  });

  @override
  State<ProductReviewListTile> createState() => _ProductReviewListTileState();
}

class _ProductReviewListTileState extends State<ProductReviewListTile> {
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
            const Text('User Name Placeholder'),
          ],
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              'Product Review placeholder Product Review placeholder Product Review placeholder Product Review placeholder Product Review placeholder Product Review placeholder Product Review placeholder Product Review placeholder',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
