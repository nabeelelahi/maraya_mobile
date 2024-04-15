import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;


  @override
  void initState() {
    super.initState();


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _visible = !_visible;
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      body: Container(
        decoration: BoxDecoration(
            color: ColorUtils.black,
            image: DecorationImage(image: AssetImage(ImageUtils.splash), fit: BoxFit.cover)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.h,),
              AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child:Image.asset(ImageUtils.appLogo, scale: 3,)
              ),
              SizedBox(height: 40.h,),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyDialogButton(
                      text: translate('strings.English'),
                      textColor: ColorUtils.dividerColor,
                      color: ColorUtils.white,
                      height: 40.h,
                      circularRadius: 0,
                      onPress: () {
                        Navigator.pushNamed(context, AppRoutes.Login);
                      },
                    ),
                    SizedBox(width: 20.w,),
                    MyDialogButton(
                      text: translate('strings.Arabic'),
                      textColor: ColorUtils.dividerColor,
                      color: ColorUtils.white,
                      height: 40.h,
                      circularRadius: 0,
                      onPress: () {
                        Navigator.pushNamed(context, AppRoutes.Login);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}