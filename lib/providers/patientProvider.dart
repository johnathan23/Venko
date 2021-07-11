import 'package:flutter/material.dart';
import 'package:venko/api/apiClient.dart';
import 'package:venko/dtos/personDto.dart';
import 'package:dio/dio.dart' hide Headers;

class PatientProvider extends ChangeNotifier{
  List<PersonDto> patients;

  Future<List<PersonDto>> getPatients() async {
    if(this.patients != null){
      return patients;
    }

    Dio _dio = Dio();
    ApiClient _apiClient = ApiClient(_dio);

    this.patients = await _apiClient.getPatients();
    notifyListeners();
    return patients;
  } 
}