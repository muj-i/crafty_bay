import 'dart:developer';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsDataInProgress = false;
  ProductDetailsData _productDetailsData = ProductDetailsData();
  String _errorMessage = '';
  final List<String> _colorCode = [];
  final List<Color> _availableColors = [];
  List<String> _availableSizes = [];

  bool get getProductDetailsDataInProgress => _getProductDetailsDataInProgress;

  ProductDetailsData get productDetailsData => _productDetailsData;

  List<String> get colorCode => _colorCode;
  List<Color> get availableColors => _availableColors;

  List<String> get availableSizes => _availableSizes;

  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsDataInProgress = true;
    update();
    final NetworkResponseRequest response =
        await NetworkResponseCaller.getRequest(Urls.getProductDetails(id));
    _getProductDetailsDataInProgress = false;
    if (response.isSuccess) {
      _productDetailsData =
          (ProductDetailsModel.fromJson(response.responseJson ?? {}))
              .data!
              .first;
      _colorCode.clear();
      _availableColors.clear();
      _storeColorCode(_productDetailsData.color ?? '');
      _convertCodeToColor();
      _convertStringToSizes(_productDetailsData.size ?? '');
      log(_availableColors.toString());
      update();
      return true;
    } else {
      _errorMessage = 'Fetch product details has been failed! Try again.';
      update();
      return false;
    }
  }

  void _storeColorCode(String color) {
    final List<String> splittedColors = color.split(',');
    for (String c in splittedColors) {
      if (c.isNotEmpty) {
        _colorCode.add(c);
      }
    }
  }

  void _convertCodeToColor() {
    for (var code in _colorCode) {
      final color = Color(int.parse(code.replaceAll('#', '0xFF')));
      _availableColors.add(color);
    }
  }

  void _convertStringToSizes(String sizes) {
    _availableSizes = sizes.split(',');
  }
}
