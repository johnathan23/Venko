import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personDto.g.dart';

@JsonSerializable()
class PersonDto {  
  
  @JsonKey(name: 'tipoDocumento')
  String documentType;
  @JsonKey(name: 'numeroDocumento')
  String documentNumber;
  @JsonKey(name: 'primerNombre')
  String firstName;
  @JsonKey(name: 'segundoNombre')
  String secondName;
  @JsonKey(name: 'primerApellido')
  String firstLastName;
  @JsonKey(name: 'segundoApellido')
  String secondLastName;


  PersonDto(); 

  PersonDto.newPerson({@required this.documentType, @required this.documentNumber, @required this.firstName, @required this.secondName, @required this.firstLastName, @required this.secondLastName}); 

  factory PersonDto.fromJson(Map<String, dynamic> json) => _$PersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);
}