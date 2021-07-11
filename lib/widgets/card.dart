import 'package:flutter/material.dart';
import 'package:venko/res/colors.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/res/styles.dart';

Card customCard({@required IconData icon, @required String name,  @required String lastName, @required String documentType, @required String documentNumber, @required void Function() onClick}){
   return Card(
    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(corner_5)),
    child: InkWell(
      borderRadius: BorderRadius.circular(corner_5),
      child: Padding(
        padding: EdgeInsets.all(padding_10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: size_40,
                color: blackcurrant,
              ),
              SizedBox(width: size_10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name $lastName',
                      style: textStyleBold(
                        fontSize: text_20,
                        color: blackcurrant
                      ),
                      maxLines: line_1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis
                    ),
                    Row(
                      children: [
                        Text(
                          '$documentType.',
                          style: textStyleNormal(
                            fontSize: text_18,
                            color: charcoal
                          ),
                          maxLines: line_1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis
                        ),
                        SizedBox(width: size_10),
                        Text(
                          documentNumber,
                          style: textStyleNormal(
                            fontSize: text_18,
                            color: charcoal
                          ),
                          maxLines: line_1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis
                        ),
                      ],
                    )
                  ]
                )
              )
            ]
          )
        )
      ),
      onTap: onClick
    )
  );
}