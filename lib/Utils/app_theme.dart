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
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadePageTransitionsBuilder(), // Example transition, you can use any other transition builder here
          TargetPlatform.iOS: FadePageTransitionsBuilder(), // Example transition, you can use any other transition builder here
        },
      ),
      fontFamily: FontUtils.clashDisplayRegular, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorUtils.white)
  );

}



class FadePageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(PageRoute<T> route, BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // Fade transition animation
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}