// import 'package:crafty_bay/data/models/product_data.dart';

// class CartAndWishListModel {
//   String? msg;
//   List<CartAndWishData>? data;

//   CartAndWishListModel({this.msg, this.data});

//   CartAndWishListModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     if (json['data'] != null) {
//       data = <CartAndWishData>[];
//       json['data'].forEach((v) {
//         data!.add(CartAndWishData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['msg'] = msg;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class CartAndWishData {
//   int? id;
//   String? email;
//   int? productId;
//   String? color;
//   String? size;
//   String? createdAt;
//   String? updatedAt;
//   ProductData? productData;
//   int numberOfItems = 1;

//   CartAndWishData(
//       {this.id,
//       this.email,
//       this.productId,
//       this.color,
//       this.size,
//       this.createdAt,
//       this.updatedAt,
//       this.productData});

//   CartAndWishData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     productId = json['product_id'];
//     color = json['color'];
//     size = json['size'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     productData =
//         json['product'] != null ? ProductData.fromJson(json['product']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['email'] = email;
//     data['product_id'] = productId;
//     data['color'] = color;
//     data['size'] = size;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (productData != null) {
//       data['product'] = productData!.toJson();
//     }
//     return data;
//   }
// }

import 'package:crafty_bay/data/models/product_data.dart';

class CartAndWishListModel {
  String? msg;
  List<CartAndWishData>? data;

  CartAndWishListModel({this.msg, this.data});

  CartAndWishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null && json['data'] is List) {
      data = <CartAndWishData>[];
      for (var v in (json['data'] as List)) {
        data!.add(CartAndWishData.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartAndWishData {
  int? id;
  String? email;
  int? productId;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  ProductData? productData;
  int numberOfItems = 1;

  CartAndWishData(
      {this.id,
      this.email,
      this.productId,
      this.color,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.productData});

  CartAndWishData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productData =
        json['product'] != null ? ProductData.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['product_id'] = productId;
    data['color'] = color;
    data['size'] = size;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productData != null) {
      data['product'] = productData!.toJson();
    }
    return data;
  }
}
