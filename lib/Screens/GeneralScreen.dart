import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';

class GeneralScreen extends StatefulWidget {
  static const String route = "GeneralScreen";

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {

  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: GeneralScreen');
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            decoration: BoxDecoration(color: ColorUtils.white),
            child: body()),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(
          child: Container(
            // height: 130.h,
            width: double.infinity,
            color: ColorUtils.white,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, bottom: 15.h),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  translate('strings.StartShopping'),
                  style: TextStyle(
                      fontFamily: FontUtils.almarenaRegular,
                      color: ColorUtils.dividerColor,
                      // decoration: TextDecoration.underline,
                      fontSize: 40.sp,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                // height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  image: DecorationImage(
                    image: AssetImage(ImageUtils.womenImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                color: ColorUtils.black.withOpacity(0.30),
                width: double.infinity,
              ),
              Positioned(
                bottom: 10.h,
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, AppRoutes.Home);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, bottom: 20.h),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        translate('strings.ForWomen'),
                        style: TextStyle(
                            fontFamily: FontUtils.almarenaRegular,
                            color: ColorUtils.white,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorUtils.dotGreen,
                            fontSize: 40.sp,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                // height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  image: DecorationImage(
                    image: AssetImage(ImageUtils.menImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                color: ColorUtils.black.withOpacity(0.30),
                width: double.infinity,
              ),
              Positioned(
                bottom: 10.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, bottom: 20.h),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      translate('strings.ForMen'),
                      style: TextStyle(
                          fontFamily: FontUtils.almarenaRegular,
                          color: ColorUtils.white,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorUtils.dotGreen,
                          fontSize: 40.sp,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}
