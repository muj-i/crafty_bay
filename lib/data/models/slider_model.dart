import 'package:crafty_bay/data/models/slider_model_data.dart';

class SliderModel {
  String? msg;
  List<SliderModelData>? data;

  SliderModel({this.msg, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <SliderModelData>[];
      json['data'].forEach((v) {
        data!.add(SliderModelData.fromJson(v));
      });
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
