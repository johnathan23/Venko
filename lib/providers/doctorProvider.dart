import 'package:flutter/material.dart';
import 'package:venko/api/apiClient.dart';
import 'package:venko/dtos/personDto.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:venko/helpers/serverError.dart';
import 'package:venko/helpers/ui.dart';
import 'package:venko/utils/util.dart';

class DoctorProvider extends ChangeNotifier {

  static Dio _dio = Dio();
  ApiClient _apiClient = ApiClient(_dio);
  List<PersonDto> doctors;

  Future<List<PersonDto>> getDoctors() async {
    if(this.doctors != null){
      return doctors;
    }

    this.doctors = await _apiClient.getDoctors();
    notifyListeners();
    return doctors;
  }

  Future newDoctor({@required BuildContext context, @required PersonDto person}) async {
    if(person.documentNumber.isNotEmpty && person.firstName.isNotEmpty && person.firstLastName.isNotEmpty){
      _apiClient.newDoctor(person)
      .whenComplete(() => Navigator.of(context).pop())
      .then((value) {
        this.doctors.add(person);
        notifyListeners();
        showToast(message: 'Se ha añadido un medico exitosamente');
      })
      .catchError((error) => ServerError(
        context: context,
        error: error
      ));
    }else{
      return showInfoDialog(
        context: context,
        title: 'Datos incompletos',
        message: 'Asegurate de que los campos tengan datos'
      );
    }
  }

  Future updateDoctor({@required BuildContext context, @required PersonDto person, @required PersonDto oldDataPerson}) async{
    if(person.documentNumber.isNotEmpty && person.firstName.isNotEmpty && person.firstLastName.isNotEmpty){
      showProgressDialog(context: context);
      _apiClient.updateDoctor(person)
      .whenComplete(() => Navigator.of(context).pop())
      .then((value) {
        int index = this.doctors.indexWhere((person) => person.firstName == oldDataPerson.firstName);
        if (index >= 0) {
          this.doctors[index] = person;
        }
        notifyListeners();
        showToast(message: 'Se ha actualizado un medico exitosamente');
      })
      .catchError((error) => ServerError(
        context: context,
        error: error
      ));
    }else{
      return showInfoDialog(
        context: context,
        title: 'Datos incompletos',
        message: 'Asegurate de que los campos tengan datos'
      );
    }
  }

  Future deleteDoctor({@required BuildContext context, @required PersonDto person}) async{
    Navigator.of(context).pop();
    showProgressDialog(context: context);
    _apiClient.deleteDoctor(person.documentNumber)
    .whenComplete(() => Navigator.of(context).pop())
    .then((value) {
      this.doctors.remove(person);
      notifyListeners();
      showToast(message: 'Se ha eliminado un medico exitosamente');
    })
    .catchError((error) => ServerError(
      context: context,
      error: error
    ));
  }

  Future searchDoctor({@required BuildContext context, @required String documentNumber}) async{
    showProgressDialog(context: context);
    _apiClient.searchDoctor(documentNumber)
    .whenComplete(() => Navigator.of(context).pop())
    .then((value) {
      notifyListeners();
    })
    .catchError((error)=> ServerError(
      context: context,
      error: error
    ));
  }
}
