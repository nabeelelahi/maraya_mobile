import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:maraya_flutter/Screens/GeneralScreen.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';

class VerificationScreen extends StatefulWidget {
  static const String route = "VerificationScreen";

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  late BuildContext _context;
  String? otp;
  late Timer _timer;
  int _start = 15;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: VerificationScreen');
    _context = context;
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            decoration: BoxDecoration(color: ColorUtils.white),
            child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: body())),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorUtils.white,
                image: DecorationImage(
                  image: AssetImage(ImageUtils.verificationImage1),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              color: ColorUtils.black.withOpacity(0.30),
              height: 300.h,
              width: double.infinity,
            ),
            Positioned(
              bottom: 10.h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    translate('strings.Verification'),
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        color: ColorUtils.white,
                        fontSize: 40.sp,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.h,
              ),
              Text(
                translate('strings.EnterOtp'),
                style: TextStyle(
                    fontFamily: FontUtils.almarenaRegular,
                    color: ColorUtils.dividerColor,
                    fontSize: 18.sp,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                translate('strings.ChangePhone'),
                style: TextStyle(
                    fontFamily: FontUtils.almarenaRegular,
                    color: ColorUtils.dividerColor,
                    decoration: TextDecoration.underline,
                    fontSize: 14.sp,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 20.h,
              ),
              OtpTextField(
                numberOfFields: 4,
                borderColor: ColorUtils.dividerColor,
                focusedBorderColor: ColorUtils.dividerColor,
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
                textStyle: TextStyle(
                    fontFamily: FontUtils.almarenaRegular,
                    color: ColorUtils.dividerColor,
                    fontSize: 45.sp,
                    fontStyle: FontStyle.normal),
                showFieldAsBox: false,
                borderWidth: 3.0,
                fieldWidth: 50.w,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here if necessary
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacement(MaterialPageRoute(builder: (context) =>
                      GeneralScreen()));
                  // Navigator.pushReplacementNamed(context, AppRoutes.General);

                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    translate('strings.ResendIn'),
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        color: ColorUtils.dividerColor,
                        decoration: TextDecoration.underline,
                        fontSize: 14.sp,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    "00:${_start.toString()}",
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        color: ColorUtils.dividerColor,
                        decoration: TextDecoration.underline,
                        fontSize: 14.sp,
                        fontStyle: FontStyle.normal),
                  ),
                ],
              )

            ],
          ),
        ),
      ],
    );
  }


}
