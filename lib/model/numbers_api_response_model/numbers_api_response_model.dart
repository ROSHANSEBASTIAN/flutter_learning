import 'package:json_annotation/json_annotation.dart';

part 'numbers_api_response_model.g.dart';

@JsonSerializable()
class NumbersApiResponseModel {
  @JsonKey(name: "text")
  String? text;

  @JsonKey(name: "number")
  int? number;

  @JsonKey(name: "found")
  bool? found;

  @JsonKey(name: "type")
  String? type;

  NumbersApiResponseModel({this.text, this.number, this.found, this.type});

  factory NumbersApiResponseModel.fromJson(Map<String, dynamic> json) {
    return _$NumbersApiResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NumbersApiResponseModelToJson(this);
}
