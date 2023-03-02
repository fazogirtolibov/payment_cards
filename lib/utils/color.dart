import 'package:flutter/material.dart';

class MyColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  static const Color primary = Color(0xFF41620C);

  // Background
  static const Color background = Color.fromARGB(255, 26, 22, 62);

  // Neutral
  static const Color neutralBlack = Color(0xFF09101D);
  static const Color neutral1 = Color(0xFF2C3A4B);
  static const Color neutral2 = Color(0xFF394452);
  static const Color neutral3 = Color(0xFF545D69);
  static const Color neutral4 = Color(0xFF6D7580);
  static const Color neutral5 = Color(0xFF858C94);
  static const Color neutral6 = Color(0xFFA5ABB3);
  static const Color neutral7 = Color(0xFFDADEE3);
  static const Color neutral8 = Color(0xFFEBEEF2);
  static const Color neutral9 = Color(0xFFF4F6F9);
  static const Color neutralWhite = Color(0xFFFFFFFF);

  // Others
  static const otherGradient1 = [
    Color(0xFF6499FF),
    Color(0xFF2972FE),
  ];
  static const otherGradient2 = [Color(0xFFFFB800), Color(0xFFFFDA7B)];
  static List<Color> otherGradient3 = [
    const Color(0xFFFF1843).withOpacity(0.9),
    const Color(0xFFFF5E7C).withOpacity(0.9)
  ];
  static const Color othersDark1 = Color(0xFF161B20);
  static const Color othersDark2 = Color(0xFF0D0D0D);
  static const Color othersDark3 = Color(0xFF141414);
  static const Color othersDark4 = Color(0xFF252525);

  // Action Neutral
  static const Color actionNeutralDefault = Color(0xFF9098A1);
  static Color actionNeutralHover = Color.alphaBlend(
      const Color(0xFF9098A1), const Color(0xFFFFFFFF).withOpacity(0.2));
  static Color actionNeutralActive = Color.alphaBlend(
      const Color(0xFF9098A1), const Color(0xFF000000).withOpacity(0.2));
  static const Color actionNeutralDisabled = Color(0xFF9098A1);
  static const Color actionNeutralInverted = Color(0xFFFFFFFF);

  // States
  static const Color success = Color(0xFF23A757);
  static const Color successBg = Color(0xFFEDF9F0);
  static const Color warning = Color(0xFFB95000);
  static const Color warningBg = Color(0xFFFFF4EC);
  static const Color error = Color(0xFFDA1414);
  static const Color errorBg = Color(0xFFFEEFEF);
  static const Color statusinfo = Color(0xFF2E5AAC);
  static const Color infoBg = Color(0xFFEEF2FA);

  //bottom nav
  // ignore: constant_identifier_names
  static const Color LightBlueish = Color(0xFF458CFF);
  // ignore: constant_identifier_names
  static const Color LightishGrey = Color(0xFF757C8E);
  // ignore: constant_identifier_names
  static const Color LightishGreen = Color(0xFF7FC014);

  static const C_E9F0FF = Color(0xffE9F0FF);
  static const C_6F9EFF = Color(0xff6F9EFF);
  static const C_424242 = Color(0xff424242);
  static const C_9E9E9E = Color(0xff9E9E9E);
  static const C_04060F = Color(0xff04060F);
  static const C_212121 = Color(0xff212121);
  static const C_616161 = Color(0xff616161);
  static const C_181A20 = Color.fromARGB(255, 11, 14, 24);
  static const C_1F222A = Color(0xff1F222A);
  static const C_E0E0E0 = Color(0xffE0E0E0);
}
