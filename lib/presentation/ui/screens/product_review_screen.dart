import 'package:crafty_bay/presentation/state_holders/get_product_review_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/add_product_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_review_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key, required this.productId});
  final int productId;
  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<GetProductReviewController>()
          .getProductReview(widget.productId);
    });
    //setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllOverAppBar(
        pageTitle: "Reviews",
        backButton: () {
          Get.back();
        },
      ),
      body: GetBuilder<GetProductReviewController>(
          builder: (getProductReviewController) {
        if (getProductReviewController.productReviewInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: getProductReviewController
                            .getProductReviewModel.data?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return ProductReviewListTile(
                        productReviewData: getProductReviewController
                            .getProductReviewModel.data![index],
                      );
                    },
                  ),
                ),
              ),
            ),
            BottomContainer(
              title:
                  'Reviews (${getProductReviewController.getProductReviewModel.data?.length ?? 0})',
              button: FloatingActionButton(
                  backgroundColor: ColorPalette.primaryColor,
                  onPressed: () {
                    Get.to(() => AddProductReviewScreen(
                          productId: widget.productId,
                        ));
                  },
                  child: const Icon(Icons.add)),
            ),
          ],
        );
      }),
    );
  }
}
