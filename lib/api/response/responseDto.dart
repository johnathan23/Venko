import 'package:json_annotation/json_annotation.dart';

part 'responseDto.g.dart';

@JsonSerializable()
class ResponseDto {  
  
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'message')
  String message;

  ResponseDto(); 

  factory ResponseDto.fromJson(Map<String, dynamic> json) => _$ResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDtoToJson(this);
}