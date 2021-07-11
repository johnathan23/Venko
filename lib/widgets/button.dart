import 'package:flutter/material.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/res/styles.dart';

Widget customButton({@required BuildContext context, @required String text, @required void Function() onClick, Color backgroundColor}) {
  return Center(
    child: ElevatedButton(
      style: buttonStyle(
        backgroundColor: backgroundColor == null ? darkCerulean : backgroundColor, 
        corners: corner_10
      ),
      child: Container(
        width: MediaQuery.of(context).size.width/1.5,
        height: size_50,
        child: Center(
          child: Text(
              text,
              style: textStyleNormal(
                color: white, 
                fontSize: text_18
              )
            ),
        ),
      ),
      onPressed: onClick,
    ),
  );
}
