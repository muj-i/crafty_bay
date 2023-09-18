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
            const Text('Name'),
          ],
        ),
        subtitle: const Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              'No description foundNo description foundNo description foundNo description foundNo description foundNo description foundNo description foundNo description foundNo description foundNo description foundNo description foundNo description foundNo description foundNo description found',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
