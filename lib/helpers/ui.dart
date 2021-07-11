import 'package:flutter/material.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/res/styles.dart';

showAlertDialog({@required BuildContext context, @required String title, @required String message, @required void Function() positiveClick, @required void Function() negativeClick}) {
  // set up the buttons
  Widget negativeButton = TextButton(
    child: Text(
      "Cancelar", 
      style: textStyleNormal(
        fontSize: text_20,
        color: blackcurrant
      )
    ),
    onPressed:  () =>  negativeClick()
  );
  Widget positiveButton = TextButton(
    child: Text(
      "Aceptar", 
      style: textStyleNormal(
        fontSize: text_20,
        color: blackcurrant
      )
    ),
    onPressed:  () => positiveClick()
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: textStyleSemiBold(
        fontSize: text_20,
        color: blackcurrant
      )
    ),
    content: Text(
      message,
      style: textStyleNormal(
        fontSize: text_16,
        color: charcoal
      )
    ),
    actions: [
      negativeButton,
      positiveButton,
    ]
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showInfoDialog({BuildContext context, String title, String message}){
  // set up the button
  Widget button = TextButton(
    child: Text(
      "OK", 
      style: textStyleNormal(color: blackcurrant, fontSize: text_18)
    ),
    onPressed:  () => Navigator.of(context).pop()
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: textStyleNormal(color: blackcurrant, fontSize: text_18)
    ),
    content: Text(
      message,
      style: textStyleNormal(color: charcoal, fontSize: text_14)
    ),
    actions: [
      button
    ]
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showProgressDialog({BuildContext context}){
  // set up the progress indicator
  Widget progress = Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(height: size_20,),
      CircularProgressIndicator(backgroundColor: darkCerulean),
      SizedBox(height: size_20,),
      Text(
        'Cargando',
        style: textStyleNormal(color: blackcurrant, fontSize: text_18)
      ),
      SizedBox(height: size_20,),
    ]
  );

  // set up the AlertDialog 
  AlertDialog alert = AlertDialog(
    content: progress
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return alert;
    }
  );
}
