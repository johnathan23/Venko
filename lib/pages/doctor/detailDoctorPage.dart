import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:venko/dtos/personDto.dart';
import 'package:venko/helpers/ui.dart';
import 'package:venko/providers/doctorProvider.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/widgets/appBar.dart';
import 'package:venko/widgets/button.dart';
import 'package:venko/widgets/entry.dart';

class DetailDoctorPage extends StatefulWidget {

  final PersonDto personDto;
  
  @override
  createState() => _DetailDoctorPageState();

  DetailDoctorPage(this.personDto);
}

class _DetailDoctorPageState extends State<DetailDoctorPage> {

  PersonDto _personDto;
  PersonDto _dataOld;
  bool _isEdit = false;
  String _documentNumber = '', _firstName = '', _secondName = '', _firstLastName ='', _secondLastName = ''; 

  @override
  void initState() {
    super.initState();
    _personDto = widget.personDto;
    _dataOld = widget.personDto;
    _documentNumber = _personDto.documentNumber;
    _firstName = _personDto.firstName;
    _secondName = _personDto.secondName; 
    _firstLastName = _personDto.firstLastName;
    _secondLastName = _personDto.secondLastName; 
  }

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: customAppBar(title: 'Detalle del Doctor'),
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
          text: _personDto.documentType,
          textInputType: TextInputType.text, 
          textInputAction: TextInputAction.next,
          onChanged: (value){
            
          }
        ),
        SizedBox(height: size_10),
        customEntry(
          eneable: _isEdit,
          hint: 'Numero de documento',
          text: _personDto.documentNumber, 
          textInputType: TextInputType.number, 
          textInputAction: TextInputAction.next,
          onChanged: (value) => _documentNumber = value
        ),
        SizedBox(height: size_10),
        customEntry(
          eneable: _isEdit,
          hint: 'Primer nombre', 
          text: _personDto.firstName,
          textInputType: TextInputType.name, 
          textInputAction: TextInputAction.next,
          onChanged: (value) => _firstName = value
        ),
        SizedBox(height: size_10),
        customEntry(
          eneable: _isEdit,
          hint: 'Segundo nombre', 
          text: _personDto.secondName,
          textInputType: TextInputType.name, 
          textInputAction: TextInputAction.next,
          onChanged: (value) => _secondName = value
        ),
        SizedBox(height: size_10),
        customEntry(
          eneable: _isEdit,
          hint: 'Primer apellido',
          text: _personDto.firstLastName, 
          textInputType: TextInputType.name, 
          textInputAction: TextInputAction.next,
          onChanged: (value) => _firstLastName = value
        ),
        SizedBox(height: size_10),
        customEntry(
          eneable: _isEdit,
          hint: 'Segundo apellido', 
          text: _personDto.secondLastName,
          textInputType: TextInputType.name, 
          textInputAction: TextInputAction.done,
          onChanged: (value) => _secondLastName = value
        ),
        SizedBox(height: size_20),
        customButton(
          context: context, 
          text: !_isEdit ? 'Editar' : 'Actualizar', 
          onClick: (){
            if(_isEdit){
              doctorProvider.updateDoctor(
                context: context, 
                person: PersonDto.newPerson(
                  documentType: 'CC', 
                  documentNumber: _documentNumber, 
                  firstName: _firstName, 
                  secondName: _secondName, 
                  firstLastName: _firstLastName, 
                  secondLastName: _secondLastName
                ),
                oldDataPerson: _dataOld
              ).then((value) => Navigator.pop(context));
            }
            setState(() => _isEdit = !_isEdit);
          }
        ),
        SizedBox(height: size_20),
        customButton(
          context: context, 
          text: 'Eliminar', 
          backgroundColor: radicalRed,
          onClick: (){
            showAlertDialog(
              context: context, 
              title: 'Eliminar Doctor', 
              message: '¿Desea eliminar este doctor?', 
              positiveClick: () { 
                doctorProvider.deleteDoctor(
                  context: context, 
                  person: _personDto
                ).then((value) => Navigator.pop(context));
              }, 
              negativeClick: () => Navigator.of(context).pop()
            );
          }
        )
      ],
    );
  }
}