import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:venko/dtos/personDto.dart';
import 'package:venko/helpers/serverError.dart';
import 'package:venko/providers/patientProvider.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/widgets/appBar.dart';
import 'package:venko/widgets/card.dart';
import 'package:venko/widgets/other.dart';

class PatientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: customAppBar(title: 'Pacientes'),
      backgroundColor: ghostWhite,
      body: FutureBuilder(
        future: patientProvider.getPatients(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<PersonDto> patients = snapshot.data;
            if(patients.isNotEmpty){
              return _setView(snapshot.data);
            }
            return withoutItems(message: 'Sin informacion para mostrar');
          }else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData){
            return withoutItems(message: 'Sin informacion para mostrar');
          }else if(snapshot.hasError){
            ServerError(
              context: context, 
              error:  snapshot.error
            );
            return Container(width: double.infinity, height: double.infinity);
          }
          return customLoading();
        }
      )
    );
  }

  Widget _setView(List<PersonDto> doctors) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding_10),
      child: ListView.builder(
        itemCount: doctors.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _itemList(doctors, index);
        }  
      ),
    );
  }

  Widget _itemList(List<PersonDto> doctors, int index) {
    return customCard(
      icon: Icons.person,
      name: doctors[index].firstName, 
      lastName: doctors[index].firstLastName,
      documentType: doctors[index].documentType,
      documentNumber: doctors[index].documentNumber, 
      onClick: () => null
    );
  }
}