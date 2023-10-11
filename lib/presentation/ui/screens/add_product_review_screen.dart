import 'package:crafty_bay/presentation/state_holders/create_product_review_controller.dart';
import 'package:crafty_bay/presentation/state_holders/get_product_review_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_appbar.dart';
import 'package:crafty_bay/presentation/ui/widgets/all_over_elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductReviewScreen extends StatelessWidget {
  AddProductReviewScreen({super.key, required this.productId});
  final int productId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameEditingController =
      TextEditingController();

  final TextEditingController _lastNameEditingController =
      TextEditingController();

  final TextEditingController _writeReviewEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllOverAppBar(
        pageTitle: "Create Review",
        backButton: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: reviewTextFromFields,
          ),
        ),
      ),
    );
  }

  Column get reviewTextFromFields {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _firstNameEditingController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'First Name',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "You must add your first name";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: _lastNameEditingController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'Last Name',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "You must add your last name";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: _writeReviewEditingController,
          maxLines: 10,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'Write Review',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "You must add product review";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        GetBuilder<CreateProductReviewController>(
            builder: (createProductReviewController) {
          if (createProductReviewController.createProductReviewInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return AllOverElevatedButton(
            buttonName: 'Submit',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                createProductReviewController
                    .createProductReview(
                        _writeReviewEditingController.text.trim(), productId)
                    .then(
                  (result) {
                    if (result) {
                      Get.snackbar(
                        'Thank you for your feedback! ツ',
                        'Review added successfully',
                        backgroundColor: Colors.green.withOpacity(.2),
                        snackPosition: SnackPosition.TOP,
                      );
                      Get.find<GetProductReviewController>()
                          .getProductReview(productId);
                    } else {
                      Get.snackbar('Opps! :(', 'Review added failed',
                          backgroundColor: Colors.red.withOpacity(.2),
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                );
                Get.back();
              }
            },
          );
        }),
      ],
    );
  }
}
