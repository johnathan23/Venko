import 'package:flutter/material.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/res/styles.dart';

Widget customEntry({@required String hint, @required TextInputType textInputType, TextCapitalization textCapitalization = TextCapitalization.none, 
@required TextInputAction textInputAction, int maxLines = 1, int minLines, String text, bool eneable = true,
 bool isPassword = false , TextEditingController controller, String errorText, IconButton iconButton,
void Function() onEditingComplete, void Function(String) onFieldSubmitted,void Function(String) onChanged, void Function(String) onSaved}){
  return Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          textCapitalization: textCapitalization,
          maxLines: maxLines,
          minLines: minLines,
          enabled: eneable,
          initialValue: text,
          style: textStyleNormal(
            fontSize: text_16,
            color: blackcurrant
          ),
          obscureText: isPassword,
          keyboardType: textInputType,
          keyboardAppearance: Brightness.dark,
          textInputAction: textInputAction,
          decoration: _customEntryDecoration(
            hint: hint,
            iconButton: iconButton,
            errorText: errorText
          ),
          controller: controller,
          validator: (value) => value.isNotEmpty ? value : null,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          onSaved: onSaved,
        )
      ]
    )
  );
}

InputDecoration _customEntryDecoration({@required String hint, @required IconButton iconButton, @required String errorText}){
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: padding_16,
      horizontal: padding_10
    ),
    labelText: hint,
    labelStyle: textStyleNormal(
      fontSize: text_18,
      color: blackcurrant
    ),
    suffixIcon: iconButton,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: charcoal,
        width: 2
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: shandyLady,
        width: 2
      )
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(corner_5)),
    errorText: errorText
  );
}

Widget iconPassword({BuildContext context, bool viewPassword, void Function() onClick}){
  return IconButton(
    icon: Icon(!viewPassword ? Icons.visibility : Icons.visibility_off),
    onPressed: ()=> onClick()
  );
}
