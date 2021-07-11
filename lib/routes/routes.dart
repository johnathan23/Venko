import 'package:flutter/material.dart';
import 'package:venko/pages/doctor/detailDoctorPage.dart';
import 'package:venko/pages/doctor/doctorPage.dart';
import 'package:venko/pages/doctor/newDoctorPage.dart';
import 'package:venko/pages/homePage.dart';
import 'package:venko/pages/patient/patientPage.dart';
import 'package:venko/utils/constants.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {

    HOME_ROUTE: (context) => HomePage(),
    // ------ Doctor routes ------
    DOCTOR_ROUTE: (context) => DoctorPage(),
    NEW_DOCTOR_ROUTE: (context) => NewDoctorPage(),
    DETAIL_DOCTOR_ROUTE: (context) => DetailDoctorPage(ModalRoute.of(context).settings.arguments),
    // ------ Patient routes ------
    PATIENT_ROUTE: (context) => PatientPage()
  };
}
