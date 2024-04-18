import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:maraya_flutter/Screens/BrandsScreen.dart';
import 'package:maraya_flutter/Screens/CartScreen.dart';
import 'package:maraya_flutter/Screens/DashboardScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import 'CategoriesScreen.dart';

class HomeScreen extends StatefulWidget {
  int? index = 0;
  HomeScreen({Key? key, this.index}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late BuildContext _context;

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      DashboardScreen(),
      BrandsScreen(),
      CategoriesScreen(),
      CartScreen(),
    ];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: Platform.isAndroid ? EdgeInsets.only(top: 6) : EdgeInsets.only(top: 4),
            child: ImageIcon(
              AssetImage(ImageUtils.home),
              color: ColorUtils.white,
            ),
          ),
        ),
        inactiveIcon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: Platform.isAndroid ? EdgeInsets.only(top: 6) : EdgeInsets.only(top: 4),
            child: ImageIcon(
              AssetImage(ImageUtils.home),
              color: ColorUtils.white,
            ),
          ),
        ),
        textStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: ColorUtils.white,
            fontSize: 12.sp,
            fontStyle: FontStyle.normal),
        title: translate('strings.Home'),
        activeColorPrimary: ColorUtils.white,
        inactiveColorPrimary: ColorUtils.white,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: Platform.isAndroid ? EdgeInsets.only(top: 6) : EdgeInsets.only(top: 4),
            child: ImageIcon(
              AssetImage(ImageUtils.brands),
              color: ColorUtils.white,
            ),
          ),
        ),
        inactiveIcon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: Platform.isAndroid ? EdgeInsets.only(top: 6) : EdgeInsets.only(top: 4),
            child: ImageIcon(
              AssetImage(ImageUtils.brands),
              color: ColorUtils.white,
            ),
          ),
        ),
        textStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: ColorUtils.white,
            fontSize: 12.sp,
            fontStyle: FontStyle.normal),
        title: translate('strings.Brands'),
        activeColorPrimary: ColorUtils.white,
        inactiveColorPrimary: ColorUtils.white,
      ),

      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: Platform.isAndroid ? EdgeInsets.only(top: 6) : EdgeInsets.only(top: 4),
            child: ImageIcon(
              AssetImage(ImageUtils.category),
              color: ColorUtils.white,
            ),
          ),
        ),
        inactiveIcon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: Platform.isAndroid ? EdgeInsets.only(top: 6) : EdgeInsets.only(top: 4),
            child: ImageIcon(
              AssetImage(ImageUtils.category),
              color: ColorUtils.white,
            ),
          ),
        ),
        textStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: ColorUtils.white,
            fontSize: 12.sp,
            fontStyle: FontStyle.normal),
        title: translate('strings.Category'),
        activeColorPrimary: ColorUtils.white,
        inactiveColorPrimary: ColorUtils.white,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: Platform.isAndroid ? EdgeInsets.only(top: 6) : EdgeInsets.only(top: 4),
            child: ImageIcon(
              AssetImage(ImageUtils.cart_black),
              color: ColorUtils.white,
            ),
          ),
        ),
        inactiveIcon: Transform.scale(
          scale: 2.5,
          child: Padding(
            padding: Platform.isAndroid ? EdgeInsets.only(top: 6) : EdgeInsets.only(top: 4),
            child: ImageIcon(
              AssetImage(ImageUtils.cart_black),
              color: ColorUtils.white,
            ),
          ),
        ),
        textStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: ColorUtils.white,
            fontSize: 12.sp,
            fontStyle: FontStyle.normal),
        title: translate('strings.Cart'),
        activeColorPrimary: ColorUtils.white,
        inactiveColorPrimary: ColorUtils.white,
      ),

    ];
  }



  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
    ));

    _controller.index = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: ColorUtils.dividerColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        onItemSelected: (index){
          setState(() {

          });
        },
        // stateManagement: _controller.index == 0 ? false : true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          colorBehindNavBar: ColorUtils.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 0),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: false,
          curve: Curves.ease,
          duration: Duration(milliseconds: 0),
        ),
        navBarStyle:
        NavBarStyle.simple, // Choose the nav bar style with this property.
      ),
    );
  }
}

