class UserProfileModel {
  String? msg;
  List<UserProfileData>? data;

  UserProfileModel({this.msg, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <UserProfileData>[];
      json['data'].forEach((v) {
        data!.add(UserProfileData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(responseJson) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserProfileData {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? city;
  String? shippingAddress;
  String? email;
  String? createdAt;
  String? updatedAt;

  UserProfileData(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.city,
      this.shippingAddress,
      this.email,
      this.createdAt,
      this.updatedAt});

  UserProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    city = json['city'];
    shippingAddress = json['shippingAddress'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobile'] = mobile;
    data['city'] = city;
    data['shippingAddress'] = shippingAddress;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
