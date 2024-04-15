import 'package:flutter/material.dart';

import 'color_utils.dart';
import 'font_utils.dart';

class AppTheme {
  static var themeData = ThemeData(
      primaryColor: ColorUtils.white,
      errorColor: Colors.redAccent,
      brightness: Brightness.light,
      canvasColor: ColorUtils.white,
      iconTheme: IconThemeData(color: ColorUtils.white),
      unselectedWidgetColor: ColorUtils.white,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      fontFamily: FontUtils.clashDisplayRegular, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorUtils.white));

}
