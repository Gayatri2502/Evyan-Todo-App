import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray90002 = fromHex('#0d062d');

  static Color gray400 = fromHex('#c8c7cc');

  static Color blueGray100 = fromHex('#d6dae2');

  static Color blueGray400 = fromHex('#74839d');

  static Color red700 = fromHex('#d03329');

  static Color blueA700 = fromHex('#0061ff');

  static Color gray900 = fromHex('#202525');

  static Color gray90001 = fromHex('#0f0e17');

  static Color amber700 = fromHex('#da9e01');

  static Color blueA70063 = fromHex('#630061ff');

  static Color red500 = fromHex('#ff3b30');

  static Color green600 = fromHex('#349765');

  static Color gray50 = fromHex('#f9fbff');

  static Color gray100 = fromHex('#fbf1f2');

  static Color deepOrangeA10033 = fromHex('#33dfa874');

  static Color black900 = fromHex('#000000');

  static Color lightBlueA700 = fromHex('#007aff');

  static Color deepOrangeA10019 = fromHex('#19dfa874');

  static Color blueGray900 = fromHex('#262b35');

  static Color blue200 = fromHex('#a6c8ff');

  static Color deepOrange400 = fromHex('#d58c48');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray70011 = fromHex('#11555555');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
