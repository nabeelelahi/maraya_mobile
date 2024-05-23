import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:maraya_flutter/Screens/BrowseScreen.dart';
import 'package:maraya_flutter/Screens/EditProfile.dart';
import 'package:maraya_flutter/Screens/WishlistScreen.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';
import 'AddAddressScreen.dart';
import 'AddPaymentMethodScreen.dart';

class ViewOrderScreen extends StatefulWidget {
  static const String route = "ViewOrderScreen";

  @override
  _ViewOrderScreenState createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {

  List<String> Images = [ImageUtils.cloth1, ImageUtils.cloth7, ImageUtils.cloth10];


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: ViewOrderScreen');
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: -12.w,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 18.0,
          ),
        ),
        title: Text("Order #1234") ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaBold , fontSize: 25.sp),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: (){
            },
            child: Padding(
                padding: EdgeInsets.only(top: 1.h, right: 5.w),
                child: Image.asset(ImageUtils.cart_black,
                  scale: 2.5,)),
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            decoration: BoxDecoration(color: ColorUtils.white),
            child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: body()))),
      ),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Status: In Delivery",
            style: TextStyle(
                color: ColorUtils.black,
                fontFamily: FontUtils.almarenaRegular,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 20.h,),
        Container(
          color: ColorUtils.listColor,
          width: double.infinity,
          padding: EdgeInsets.zero,
          height: 120.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () async {
                    await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (_) => ImageDialog(Images)
                    );
                  },
                  child: Image.asset(ImageUtils.cloth1,)),
              SizedBox(width: 10.w,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 140.w,
                          height: 23.h,
                          child: Text(
                            "Asymmetric Draped Maxi Dress in Sequins",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 14.sp),),
                        ),
                        SizedBox(width: 10.w,),
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            "1,000 SAR",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontUtils.almarenaBold,
                                fontSize: 14.sp),),
                        )
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: ColorUtils.dodgerBlue,
                          width: 115.w,
                          child: Text(
                            "Color: Red",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 12.sp),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Container(
                      // color: ColorUtils.dodgerBlue,
                      width: 115.w,
                      child: Text(
                        "Size: M",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 12.sp),),
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 175.w,
                          child: Text(
                            "Quantity: 1",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 12.sp),),
                        ),
                        Text(
                          "Reorder",
                          style: TextStyle(
                              color: ColorUtils.dividerColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorUtils.dotGreen,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 12.sp),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30.h,),
        Text(
          "Select Delivery Method",
          style: TextStyle(
              color: ColorUtils.dividerColor,
              fontWeight: FontWeight.w400,
              fontFamily: FontUtils.almarenaBold,
              fontSize: 16.sp),),
        SizedBox(height: 15.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageUtils.checkbox, scale: 3,),
                SizedBox(width: 5.w,),
                Text(
                  "Quick Delivery (1 - 3 hours), within Riyadh",
                  style: TextStyle(
                      color: ColorUtils.dividerColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 13.sp),),
              ],
            ),
            Text(
              "50 SAR",
              style: TextStyle(
                  color: ColorUtils.dividerColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 14.sp),),
          ],
        ),
        SizedBox(height: 30.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Product Total",
              style: TextStyle(
                  color: ColorUtils.dividerColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaBold,
                  fontSize: 16.sp),),
            Text(
              "1,800 SAR",
              style: TextStyle(
                  color: ColorUtils.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 16.sp),),
          ],
        ),
        Divider(
          height: 15.h,
          color: ColorUtils.black,
          thickness: 1,
        ),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "VAT",
              style: TextStyle(
                  color: ColorUtils.dividerColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 14.sp),),
            Text(
              "200 SAR",
              style: TextStyle(
                  color: ColorUtils.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 14.sp),),
          ],
        ),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Delivery Cost",
              style: TextStyle(
                  color: ColorUtils.dividerColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 14.sp),),
            Text(
              "50 SAR",
              style: TextStyle(
                  color: ColorUtils.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 14.sp),),
          ],
        ),
        Divider(
          height: 15.h,
          color: ColorUtils.black,
          thickness: 1,
        ),
        SizedBox(height: 5.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sum Total",
              style: TextStyle(
                  color: ColorUtils.dividerColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 16.sp),),
            Text(
              "2050 SAR",
              style: TextStyle(
                  color: ColorUtils.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 14.sp),),
          ],
        ),
        SizedBox(height: 30.h,),
        Text(
          "Payment Method",
          style: TextStyle(
              color: ColorUtils.black,
              fontWeight: FontWeight.w700,
              fontFamily: FontUtils.almarenaRegular,
              fontSize: 16.sp),),
        SizedBox(height: 15.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "*********1234",
              style: TextStyle(
                  color: ColorUtils.dividerColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 14.sp),),
            Image.asset(ImageUtils.master, scale: 3,)
          ],
        ),
        SizedBox(height: 30.h,),
        Text(
          "Deliver To",
          style: TextStyle(
              color: ColorUtils.black,
              fontWeight: FontWeight.w700,
              fontFamily: FontUtils.almarenaRegular,
              fontSize: 16.sp),),
        SizedBox(height: 15.h,),
        Text(
          "House # 1, abc street, xyz area, riyadh",
          style: TextStyle(
              color: ColorUtils.dividerColor,
              fontWeight: FontWeight.w400,
              fontFamily: FontUtils.almarenaRegular,
              fontSize: 14.sp),),

      ],
    );
  }

  Widget ImageDialog(List<String> images){
    int INDEX = 0;
    return Dialog(
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState){
              return Stack(
                children: [
                  Container(
                    height: 400.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset(images[INDEX]).image,
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  Positioned(
                      right: 5.w,
                      top: 200.h,
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              if(INDEX == 2){}
                              else if(INDEX < 2){
                                INDEX = INDEX++;
                                print(INDEX++);
                              }
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_right_sharp, size: 40, color: ColorUtils.black,))),
                  Positioned(
                      left: 5.w,
                      top: 200.h,
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              if(INDEX == 0){}
                              else if(INDEX > 0){
                                print(INDEX--);
                                INDEX = INDEX--;
                              }
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_left_sharp, size: 40, color: ColorUtils.black,)))
                ],
              );
            }
        )
    );
  }
}
