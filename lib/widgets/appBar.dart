import 'package:flutter/material.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/res/styles.dart';

Widget customAppBar({@required String title}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: darkCerulean,
    iconTheme: IconThemeData(color: white),
    title: Text(
      title,
      style: textStyleBold(
        fontSize: text_18, 
        color: white
      )
    )
  );
}


AppBar customAppBarSearch({@required String title, IconData iconName, void Function() onClick}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: darkCerulean,
    iconTheme: IconThemeData(color: white),
    title: Text(
      title,
      style: textStyleBold(
        fontSize: text_18, 
        color: white
      )
    ),
    actions: [
      IconButton(
        icon: Icon(
          iconName,
          color: white,
        ),
        onPressed: onClick
      )
    ],
  );
}
