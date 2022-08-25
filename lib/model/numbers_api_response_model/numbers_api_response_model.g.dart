// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numbers_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumbersApiResponseModel _$NumbersApiResponseModelFromJson(
        Map<String, dynamic> json) =>
    NumbersApiResponseModel(
      text: json['text'] as String?,
      number: json['number'] as int?,
      found: json['found'] as bool?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NumbersApiResponseModelToJson(
        NumbersApiResponseModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': instance.number,
      'found': instance.found,
      'type': instance.type,
    };
