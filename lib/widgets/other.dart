import 'package:flutter/material.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/res/styles.dart';

Widget withoutItems({@required String message}){
  return Center(
    child: Text(
      message,
      style: textStyleSemiBold(color: blackcurrant, fontSize: text_30),
      textAlign: TextAlign.center
    )
  );
}

Widget customLoading(){
  return Center(child: CircularProgressIndicator(strokeWidth: 2 ));
}
