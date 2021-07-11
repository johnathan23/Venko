import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:venko/dtos/personDto.dart';
import 'package:venko/helpers/serverError.dart';
import 'package:venko/providers/doctorProvider.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/utils/constants.dart';
import 'package:venko/widgets/appBar.dart';
import 'package:venko/widgets/card.dart';
import 'package:venko/widgets/other.dart';
import 'package:venko/widgets/searchBar.dart';

BuildContext _context;

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _context = context;
    final doctorProvider = Provider.of<DoctorProvider>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: customAppBarSearch(
        title: 'Doctores',
        iconName: Icons.search,
        onClick: () async {
          await showSearch<String>(
            context: context,
            delegate: SearchDoctor(doctorProvider.doctors),
          );
        }),
      backgroundColor: ghostWhite ,
      body: FutureBuilder(
        future: doctorProvider.getDoctors(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<PersonDto> doctors = snapshot.data;
            if(doctors.isNotEmpty){
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: white,),
        backgroundColor: darkCerulean,
        onPressed: () => Navigator.pushNamed(context, NEW_DOCTOR_ROUTE) 
      ),
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
      icon: Icons.local_hospital,
      name: doctors[index].firstName, 
      lastName: doctors[index].firstLastName,
      documentType: doctors[index].documentType,
      documentNumber: doctors[index].documentNumber, 
      onClick: () => Navigator.pushNamed(
        _context, 
        DETAIL_DOCTOR_ROUTE,
        arguments: doctors[index]
      )
    );
  }
}