import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

class AppScreenTransition{

  late DateTime currentBackPressTime;

  static PageTransition setTransition(Widget widget) {
    var animation = PageTransitionType.rightToLeft;
    return PageTransition(
        child: widget, type: animation, duration: const Duration(milliseconds: 300));
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      //toast('Press again to exit!');
      return Future.value(false);
    }
    return Future.value(true);
  }
}