import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:venko/dtos/personDto.dart';
import 'package:venko/providers/doctorProvider.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/widgets/appBar.dart';
import 'package:venko/widgets/button.dart';
import 'package:venko/widgets/entry.dart';

class NewDoctorPage extends StatefulWidget {

  @override
  createState() => _NewDoctorPageState();
}

class _NewDoctorPageState extends State<NewDoctorPage> {

  String _documentNumber = '', _firstName = '', _secondName = '', _firstLastName ='', _secondLastName = ''; 
  
  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: customAppBar(title: 'Nuevo Doctor'),
      body: Padding(
        padding: EdgeInsets.all(padding_10),
        child: SingleChildScrollView(child: _setView(context, doctorProvider)),
      )
    );
  }

  Column _setView(BuildContext context, DoctorProvider doctorProvider) {
    return Column(
      children: [
        customEntry(
          eneable: false,
          hint: 'Tipo de documento', 
          text: 'CC',
          textInputType: TextInputType.text, 
          textInputAction: TextInputAction.next,
          onChanged: (value){
            
          }
        ),
        SizedBox(height: size_10),
        customEntry(
          hint: 'Numero de documento', 
          textInputType: TextInputType.number, 
          textInputAction: TextInputAction.next,
          onChanged: (value) => _documentNumber = value 
        ),
        SizedBox(height: size_10),
        customEntry(
          hint: 'Primer nombre', 
          textInputType: TextInputType.name, 
          textInputAction: TextInputAction.next,
          onChanged: (value) => _firstName = value
        ),
        SizedBox(height: size_10),
        customEntry(
          hint: 'Segundo nombre', 
          textInputType: TextInputType.name, 
          textInputAction: TextInputAction.next,
          onChanged: (value) => _secondName = value
        ),
        SizedBox(height: size_10),
        customEntry(
          hint: 'Primer apellido', 
          textInputType: TextInputType.name, 
          textInputAction: TextInputAction.next,
          onChanged: (value) => _firstLastName = value
        ),
        SizedBox(height: size_10),
        customEntry(
          hint: 'Segundo apellido', 
          textInputType: TextInputType.name, 
          textInputAction: TextInputAction.done,
          onChanged: (value) => _secondLastName = value
        ),
        SizedBox(height: size_20),
        customButton(
          context: context, 
          text: 'Crear', 
          onClick: () {
            doctorProvider.newDoctor(
              context: context, 
              person: PersonDto.newPerson(
                documentType: 'CC', 
                documentNumber: _documentNumber, 
                firstName: _firstName, 
                secondName: _secondName, 
                firstLastName: _firstLastName, 
                secondLastName: _secondLastName
              )
            );
          }
        )
      ],
    );
  }
}