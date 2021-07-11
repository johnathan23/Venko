//0xFF + color hexadecimal
import 'package:flutter/material.dart';

MaterialColor white = MaterialColor(0xffFCFCFC, _getColorVariants(0xffFCFCFC));
MaterialColor shandyLady = MaterialColor(0xff9E9C9D, _getColorVariants(0xff9E9C9D));
MaterialColor charcoal = MaterialColor(0xff4A4545, _getColorVariants(0xff4A4545));
MaterialColor blackcurrant = MaterialColor(0xff0E0C11, _getColorVariants(0xff0E0C11));
MaterialColor irisBlue = MaterialColor(0xff16B7CC, _getColorVariants(0xff16B7CC));
MaterialColor darkCerulean = MaterialColor(0xff0B4A75, _getColorVariants(0xff0B4A75));
MaterialColor ghostWhite = MaterialColor(0xffF3F4F9, _getColorVariants(0xffF3F4F9));
MaterialColor radicalRed = MaterialColor(0xffF7455E, _getColorVariants(0xffF7455E));

Map<int, Color> _getColorVariants(int color){
  Map<int, Color> colorVariants = {
    50:Color(color),
    100:Color(color),
    200:Color(color),
    300:Color(color),
    400:Color(color),
    500:Color(color),
    600:Color(color),
    700:Color(color),
    800:Color(color),
    900:Color(color),
  };
  return colorVariants;
}
