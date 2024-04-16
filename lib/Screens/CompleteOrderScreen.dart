import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:maraya_flutter/Screens/FilterScreen.dart';
import 'package:maraya_flutter/Screens/HomeScreen.dart';
import 'package:maraya_flutter/Screens/ProductDetailScreen.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';

class CompleteOrderScreen extends StatefulWidget {
  static const String route = "CompleteOrderScreen";
  CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  _CompleteOrderScreenState createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {

  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: CompleteOrderScreen');
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox(),
        titleSpacing: -35.w,
        title: Text("Congratulations") ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaBold , fontSize: 25.sp),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: (){
            },
            child: Padding(
                padding: EdgeInsets.only(top: 1.h, right: 5.w),
                child: Image.asset(ImageUtils.person,
                  scale: 1.7,)),
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorUtils.black,
          image: DecorationImage(image: AssetImage(ImageUtils.checkout_image), fit: BoxFit.fill)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h,),
            Text(
              "Your order has\nbeen placed",
              style: TextStyle(
                  color: ColorUtils.white,
                  fontFamily: FontUtils.almarenaBold,
                  fontSize: 35.sp),
            ),
            SizedBox(height: 10.h,),
            Text(
              "We will send you an email to track\nyour order ",
              style: TextStyle(
                  color: ColorUtils.white,
                  fontFamily: FontUtils.almarenaBold,
                  fontSize: 18.sp),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context, rootNavigator: true)
                          .pushReplacement(MaterialPageRoute(builder: (context) =>
                          HomeScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 42.h,
                      color: ColorUtils.dividerColor,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Continue Shopping",
                              style: TextStyle(
                                  color: ColorUtils.white,
                                  fontFamily: FontUtils.almarenaRegular,
                                  fontSize: 20.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
