import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:maraya_flutter/Screens/AddAddressScreen.dart';
import 'package:maraya_flutter/Screens/AddPaymentMethodScreen.dart';
import 'package:maraya_flutter/Screens/CompleteOrderScreen.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';
import 'FilterScreen.dart';
import 'HomeScreen.dart';
import 'ProductDetailScreen.dart';

class CartScreen extends StatefulWidget {
  static const String route = "CartScreen";
  bool? show;
  CartScreen({Key? key,this.show}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  bool IsReview = false;
  bool cardSelected = false;
  String title = "Your Bag";
  bool quick = true;
  bool same = false;
  bool standard = false;
  List<Map<String,dynamic>> colors = [];
  List<Map<String,dynamic>> sizes = [];
  List<String> Images = [ImageUtils.cloth1, ImageUtils.cloth7, ImageUtils.cloth10];

  bool address1 = true, address2 = false, address3 = false;
  bool bycard = true, byTabby = false, byTamara = false, byApple = false;


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    colors =[
      {
        "color": ColorUtils.clothColor1,
        "state": true,
      },
      {
        "color": ColorUtils.black,
        "state": false,
      },
      {
        "color": ColorUtils.clothColor2,
        "state": false,
      },
      {
        "color": ColorUtils.blueyGrey,
        "state": false,
      },
    ];
    sizes =[
      {
        "size": "2XS",
        "state": true,
      },
      {
        "size": "S",
        "state": false,
      },
      {
        "size": "M",
        "state": false,
      },
      {
        "size": "L",
        "state": false,
      },
      {
        "size": "XL",
        "state": false,
      },
      {
        "size": "2XL",
        "state": false,
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: CartScreen');
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox(),
        titleSpacing: -35.w,
        title: Text(title) ,
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
                  scale: 2.5,)),
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: body()),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 220.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You made some\namazing choices today.",
                      style: TextStyle(
                          color: ColorUtils.black,
                          // height: 1.2,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontUtils.almarenaBold,
                          fontSize: 20.sp),),
                    SizedBox(height: 10.h,),
                    Text(
                      "You are only a few steps away from looking your best",
                      style: TextStyle(
                          color: ColorUtils.black,
                          height: 1.1,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontUtils.almarenaLight,
                          fontSize: 18.sp),),
                  ],
                ),
              ),
              Image.asset(ImageUtils.handbag, scale: 3.5,)
            ],
          ),
          SizedBox(height: 15.h,),
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
                            width: 150.w,
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
                          SizedBox(width: 5.w,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Quantity :  ",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 12.sp),
                              ),
                              Image.asset(ImageUtils.minus, scale: 4, color: ColorUtils.black,),
                              SizedBox(width: 10.w,),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(width: 10.w,),
                              Image.asset(ImageUtils.plus, scale: 4, color: ColorUtils.black,)
                            ],
                          )
                        ],
                      ),
                      // SizedBox(height: 5.h,),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Add to wishlist",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 10.sp),),
                          SizedBox(width: 22.w,),
                          Text(
                            "Remove from list",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 10.sp),),
                          SizedBox(width: 55.w,),
                          InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                    context: context,
                                    isDismissible: true,
                                    useRootNavigator: true,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setState){
                                          return Container(
                                            height: 260.h,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Change color or size",
                                                        style: TextStyle(
                                                            color: ColorUtils.dividerColor,
                                                            fontFamily: FontUtils.almarenaRegular,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 20.sp),
                                                      ),
                                                      InkWell(
                                                          onTap: (){
                                                            Navigator.pop(context);
                                                          },
                                                          child: Image.asset(ImageUtils.cross, scale: 2,))
                                                    ],
                                                  ),
                                                  SizedBox(height: 20.h,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 3.h),
                                                        child: Text(
                                                          "Color : ",
                                                          style: TextStyle(
                                                              color: ColorUtils.black,
                                                              fontFamily: FontUtils.almarenaRegular,
                                                              fontSize: 16.sp),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                colors[0]["state"] = true;
                                                                colors[1]["state"] = false;
                                                                colors[2]["state"] = false;
                                                                colors[3]["state"] = false;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 20.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 12,
                                                                    backgroundColor: colors[0]["color"],
                                                                  ),
                                                                  Visibility(
                                                                    visible: colors[0]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.black,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 15.w,),
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                colors[0]["state"] = false;
                                                                colors[1]["state"] = true;
                                                                colors[2]["state"] = false;
                                                                colors[3]["state"] = false;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 20.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 12,
                                                                    backgroundColor: colors[1]["color"],
                                                                  ),
                                                                  Visibility(
                                                                    visible: colors[1]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.black,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 15.w,),
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                colors[0]["state"] = false;
                                                                colors[1]["state"] = false;
                                                                colors[2]["state"] = true;
                                                                colors[3]["state"] = false;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 20.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 12,
                                                                    backgroundColor: colors[2]["color"],
                                                                  ),
                                                                  Visibility(
                                                                    visible: colors[2]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.black,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 15.w,),
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                colors[0]["state"] = false;
                                                                colors[1]["state"] = false;
                                                                colors[2]["state"] = false;
                                                                colors[3]["state"] = true;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 20.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 12,
                                                                    backgroundColor: colors[3]["color"],
                                                                  ),
                                                                  Visibility(
                                                                    visible: colors[3]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.black,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.h,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 3.h),
                                                        child: Text(
                                                          "Size : ",
                                                          style: TextStyle(
                                                              color: ColorUtils.black,
                                                              fontFamily: FontUtils.almarenaRegular,
                                                              fontSize: 16.sp),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                sizes[0]["state"] = true;
                                                                sizes[1]["state"] = false;
                                                                sizes[2]["state"] = false;
                                                                sizes[3]["state"] = false;
                                                                sizes[4]["state"] = false;
                                                                sizes[5]["state"] = false;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 28.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    sizes[0]["size"],
                                                                    style: TextStyle(
                                                                        color: ColorUtils.black,
                                                                        fontFamily: FontUtils.almarenaRegular,
                                                                        fontSize: 14.sp),
                                                                  ),
                                                                  Visibility(
                                                                    visible: sizes[0]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.black,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 13.w,),
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                sizes[0]["state"] = false;
                                                                sizes[1]["state"] = true;
                                                                sizes[2]["state"] = false;
                                                                sizes[3]["state"] = false;
                                                                sizes[4]["state"] = false;
                                                                sizes[5]["state"] = false;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 13.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    sizes[1]["size"],
                                                                    style: TextStyle(
                                                                        color: ColorUtils.black,
                                                                        fontFamily: FontUtils.almarenaRegular,
                                                                        fontSize: 14.sp),
                                                                  ),
                                                                  Visibility(
                                                                    visible: sizes[1]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.black,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 13.w,),
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                sizes[0]["state"] = false;
                                                                sizes[1]["state"] = false;
                                                                sizes[2]["state"] = true;
                                                                sizes[3]["state"] = false;
                                                                sizes[4]["state"] = false;
                                                                sizes[5]["state"] = false;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 13.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    sizes[2]["size"],
                                                                    style: TextStyle(
                                                                        color: ColorUtils.hintColor,
                                                                        fontFamily: FontUtils.almarenaRegular,
                                                                        fontSize: 14.sp),
                                                                  ),
                                                                  Visibility(
                                                                    visible: sizes[2]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.hintColor,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 13.w,),
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                sizes[0]["state"] = false;
                                                                sizes[1]["state"] = false;
                                                                sizes[2]["state"] = false;
                                                                sizes[3]["state"] = true;
                                                                sizes[4]["state"] = false;
                                                                sizes[5]["state"] = false;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 13.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    sizes[3]["size"],
                                                                    style: TextStyle(
                                                                        color: ColorUtils.black,
                                                                        fontFamily: FontUtils.almarenaRegular,
                                                                        fontSize: 14.sp),
                                                                  ),
                                                                  Visibility(
                                                                    visible: sizes[3]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.black,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 13.w,),
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                sizes[0]["state"] = false;
                                                                sizes[1]["state"] = false;
                                                                sizes[2]["state"] = false;
                                                                sizes[3]["state"] = false;
                                                                sizes[4]["state"] = true;
                                                                sizes[5]["state"] = false;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 20.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    sizes[4]["size"],
                                                                    style: TextStyle(
                                                                        color: ColorUtils.black,
                                                                        fontFamily: FontUtils.almarenaRegular,
                                                                        fontSize: 14.sp),
                                                                  ),
                                                                  Visibility(
                                                                    visible: sizes[4]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.black,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 13.w,),
                                                          InkWell(
                                                            onTap:(){
                                                              setState(() {
                                                                sizes[0]["state"] = false;
                                                                sizes[1]["state"] = false;
                                                                sizes[2]["state"] = false;
                                                                sizes[3]["state"] = false;
                                                                sizes[4]["state"] = false;
                                                                sizes[5]["state"] = true;
                                                              });
                                                            },
                                                            child: SizedBox(
                                                              width: 28.w,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    sizes[5]["size"],
                                                                    style: TextStyle(
                                                                        color: ColorUtils.hintColor,
                                                                        fontFamily: FontUtils.almarenaRegular,
                                                                        fontSize: 14.sp),
                                                                  ),
                                                                  Visibility(
                                                                    visible: sizes[5]["state"],
                                                                    child: Divider(
                                                                      height: 10,
                                                                      color: ColorUtils.hintColor,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )

                                                    ],
                                                  ),
                                                  SizedBox(height: 15.h,),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'This model is 6ft tall and is wearing size L.',
                                                          style: TextStyle(
                                                              color: ColorUtils.black,
                                                              fontFamily: FontUtils.almarenaRegular,
                                                              fontSize: 13.sp),),
                                                        SizedBox(width: 1.w,),
                                                        InkWell(
                                                          onTap: (){
                                                            showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return Dialog(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(0.0)), //this right here
                                                                    child: Container(
                                                                      height: 300.h,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(12.0),
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                                alignment: Alignment.centerRight,
                                                                                child: InkWell(
                                                                                    onTap: (){
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Image.asset(ImageUtils.cross, scale: 2,))),
                                                                            SizedBox(height: 15.h,),
                                                                            Table(
                                                                              border: TableBorder.all(color: Colors.black),
                                                                              children: [
                                                                                TableRow(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "SIZE",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "BUST",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "WAIST",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "HIP",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                TableRow(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "XS",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "32",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "26",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "35",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                TableRow(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "S",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "34",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "28",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "38",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                TableRow(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "M",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "38",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "30",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "40",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                TableRow(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "L",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "38",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "32",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "42",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                TableRow(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "XL",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "40",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "34",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "44",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                TableRow(
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "XXL",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "42",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "36",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                        child: Text(
                                                                                          "46",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: ColorUtils.dividerColor,
                                                                                              fontFamily: FontUtils.almarenaDisplayBold,
                                                                                              fontSize: 16.sp),
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          },
                                                          child: Text(
                                                            'View Size Chart',
                                                            style: TextStyle(
                                                                color: ColorUtils.black,
                                                                decoration: TextDecoration.underline,
                                                                fontFamily: FontUtils.almarenaRegular,
                                                                fontSize: 14.sp),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 20.h,),
                                                  MyButton(
                                                    text: "Select",
                                                    textColor: ColorUtils.white,
                                                    circularRadius: 0,
                                                    onPress: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    });
                              },
                              child: Image.asset(ImageUtils.pencil, scale: 1.6,))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            color: ColorUtils.listColor,
            width: double.infinity,
            padding: EdgeInsets.zero,
            height: 120.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageUtils.shoe,),
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
                            width: 150.w,
                            height: 23.h,
                            child: Text(
                              "Nike Retro High",
                              style: TextStyle(
                                  color: ColorUtils.dividerColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontUtils.almarenaRegular,
                                  fontSize: 14.sp),),
                          ),
                          SizedBox(width: 10.w,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.w,
                                child: Text(
                                  "800 SAR",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorUtils.dividerColor,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontUtils.almarenaBold,
                                      fontSize: 14.sp),),
                              ),
                              SizedBox(height: 2.h,),
                              SizedBox(
                                width: 70.w,
                                child: Text(
                                  "1,000 SAR",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorUtils.hintColor,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontUtils.almarenaRegular,
                                      fontSize: 12.sp),),
                              )
                            ],
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
                              "Color: Black",
                              style: TextStyle(
                                  color: ColorUtils.dividerColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontUtils.almarenaRegular,
                                  fontSize: 12.sp),),
                          ),
                          SizedBox(width: 5.w,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Quantity :  ",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 12.sp),
                              ),
                              Image.asset(ImageUtils.minus, scale: 4, color: ColorUtils.black,),
                              SizedBox(width: 10.w,),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(width: 10.w,),
                              Image.asset(ImageUtils.plus, scale: 4, color: ColorUtils.black,)
                            ],
                          )
                        ],
                      ),
                      // SizedBox(height: 5.h,),
                      Container(
                        // color: ColorUtils.dodgerBlue,
                        width: 115.w,
                        child: Text(
                          "Size: EUR 10",
                          style: TextStyle(
                              color: ColorUtils.dividerColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 12.sp),),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Add to wishlist",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 10.sp),),
                          SizedBox(width: 22.w,),
                          Text(
                            "Remove from list",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 10.sp),),
                          SizedBox(width: 55.w,),
                          InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                  context: context,
                                  isDismissible: true,
                                  useRootNavigator: true,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setState){
                                        return Container(
                                          height: 260.h,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Change color or size",
                                                      style: TextStyle(
                                                          color: ColorUtils.dividerColor,
                                                          fontFamily: FontUtils.almarenaRegular,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 20.sp),
                                                    ),
                                                    InkWell(
                                                      onTap: (){
                                                        Navigator.pop(context);
                                                      },
                                                        child: Image.asset(ImageUtils.cross, scale: 2,))
                                                  ],
                                                ),
                                                SizedBox(height: 20.h,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 3.h),
                                                      child: Text(
                                                        "Color : ",
                                                        style: TextStyle(
                                                            color: ColorUtils.black,
                                                            fontFamily: FontUtils.almarenaRegular,
                                                            fontSize: 16.sp),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              colors[0]["state"] = true;
                                                              colors[1]["state"] = false;
                                                              colors[2]["state"] = false;
                                                              colors[3]["state"] = false;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 20.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 12,
                                                                  backgroundColor: colors[0]["color"],
                                                                ),
                                                                Visibility(
                                                                  visible: colors[0]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.black,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 15.w,),
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              colors[0]["state"] = false;
                                                              colors[1]["state"] = true;
                                                              colors[2]["state"] = false;
                                                              colors[3]["state"] = false;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 20.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 12,
                                                                  backgroundColor: colors[1]["color"],
                                                                ),
                                                                Visibility(
                                                                  visible: colors[1]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.black,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 15.w,),
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              colors[0]["state"] = false;
                                                              colors[1]["state"] = false;
                                                              colors[2]["state"] = true;
                                                              colors[3]["state"] = false;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 20.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 12,
                                                                  backgroundColor: colors[2]["color"],
                                                                ),
                                                                Visibility(
                                                                  visible: colors[2]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.black,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 15.w,),
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              colors[0]["state"] = false;
                                                              colors[1]["state"] = false;
                                                              colors[2]["state"] = false;
                                                              colors[3]["state"] = true;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 20.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 12,
                                                                  backgroundColor: colors[3]["color"],
                                                                ),
                                                                Visibility(
                                                                  visible: colors[3]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.black,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10.h,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 3.h),
                                                      child: Text(
                                                        "Size : ",
                                                        style: TextStyle(
                                                            color: ColorUtils.black,
                                                            fontFamily: FontUtils.almarenaRegular,
                                                            fontSize: 16.sp),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              sizes[0]["state"] = true;
                                                              sizes[1]["state"] = false;
                                                              sizes[2]["state"] = false;
                                                              sizes[3]["state"] = false;
                                                              sizes[4]["state"] = false;
                                                              sizes[5]["state"] = false;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 28.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  sizes[0]["size"],
                                                                  style: TextStyle(
                                                                      color: ColorUtils.black,
                                                                      fontFamily: FontUtils.almarenaRegular,
                                                                      fontSize: 14.sp),
                                                                ),
                                                                Visibility(
                                                                  visible: sizes[0]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.black,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 13.w,),
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              sizes[0]["state"] = false;
                                                              sizes[1]["state"] = true;
                                                              sizes[2]["state"] = false;
                                                              sizes[3]["state"] = false;
                                                              sizes[4]["state"] = false;
                                                              sizes[5]["state"] = false;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 13.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  sizes[1]["size"],
                                                                  style: TextStyle(
                                                                      color: ColorUtils.black,
                                                                      fontFamily: FontUtils.almarenaRegular,
                                                                      fontSize: 14.sp),
                                                                ),
                                                                Visibility(
                                                                  visible: sizes[1]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.black,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 13.w,),
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              sizes[0]["state"] = false;
                                                              sizes[1]["state"] = false;
                                                              sizes[2]["state"] = true;
                                                              sizes[3]["state"] = false;
                                                              sizes[4]["state"] = false;
                                                              sizes[5]["state"] = false;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 13.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  sizes[2]["size"],
                                                                  style: TextStyle(
                                                                      color: ColorUtils.hintColor,
                                                                      fontFamily: FontUtils.almarenaRegular,
                                                                      fontSize: 14.sp),
                                                                ),
                                                                Visibility(
                                                                  visible: sizes[2]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.hintColor,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 13.w,),
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              sizes[0]["state"] = false;
                                                              sizes[1]["state"] = false;
                                                              sizes[2]["state"] = false;
                                                              sizes[3]["state"] = true;
                                                              sizes[4]["state"] = false;
                                                              sizes[5]["state"] = false;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 13.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  sizes[3]["size"],
                                                                  style: TextStyle(
                                                                      color: ColorUtils.black,
                                                                      fontFamily: FontUtils.almarenaRegular,
                                                                      fontSize: 14.sp),
                                                                ),
                                                                Visibility(
                                                                  visible: sizes[3]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.black,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 13.w,),
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              sizes[0]["state"] = false;
                                                              sizes[1]["state"] = false;
                                                              sizes[2]["state"] = false;
                                                              sizes[3]["state"] = false;
                                                              sizes[4]["state"] = true;
                                                              sizes[5]["state"] = false;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 20.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  sizes[4]["size"],
                                                                  style: TextStyle(
                                                                      color: ColorUtils.black,
                                                                      fontFamily: FontUtils.almarenaRegular,
                                                                      fontSize: 14.sp),
                                                                ),
                                                                Visibility(
                                                                  visible: sizes[4]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.black,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 13.w,),
                                                        InkWell(
                                                          onTap:(){
                                                            setState(() {
                                                              sizes[0]["state"] = false;
                                                              sizes[1]["state"] = false;
                                                              sizes[2]["state"] = false;
                                                              sizes[3]["state"] = false;
                                                              sizes[4]["state"] = false;
                                                              sizes[5]["state"] = true;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: 28.w,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  sizes[5]["size"],
                                                                  style: TextStyle(
                                                                      color: ColorUtils.hintColor,
                                                                      fontFamily: FontUtils.almarenaRegular,
                                                                      fontSize: 14.sp),
                                                                ),
                                                                Visibility(
                                                                  visible: sizes[5]["state"],
                                                                  child: Divider(
                                                                    height: 10,
                                                                    color: ColorUtils.hintColor,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )

                                                  ],
                                                ),
                                                SizedBox(height: 15.h,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'This model is 6ft tall and is wearing size L. ',
                                                      style: TextStyle(
                                                          color: ColorUtils.black,
                                                          fontFamily: FontUtils.almarenaRegular,
                                                          fontSize: 13.sp),),
                                                    SizedBox(width: 1.w,),
                                                    InkWell(
                                                      onTap: (){
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return Dialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(0.0)), //this right here
                                                                child: Container(
                                                                  height: 300.h,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(12.0),
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Align(
                                                                            alignment: Alignment.centerRight,
                                                                            child: InkWell(
                                                                                onTap: (){
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Image.asset(ImageUtils.cross, scale: 2,))),
                                                                        SizedBox(height: 15.h,),
                                                                        Table(
                                                                          border: TableBorder.all(color: Colors.black),
                                                                          children: [
                                                                            TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "SIZE",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "BUST",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "WAIST",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "HIP",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                            TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "XS",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "32",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "26",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "35",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                            TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "S",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "34",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "28",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "38",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                            TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "M",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "38",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "30",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "40",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                            TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "L",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "38",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "32",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "42",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                            TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "XL",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "40",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "34",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "44",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                            TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "XXL",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "42",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "36",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                                                                    child: Text(
                                                                                      "46",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                          color: ColorUtils.dividerColor,
                                                                                          fontFamily: FontUtils.almarenaDisplayBold,
                                                                                          fontSize: 16.sp),
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      child: Text(
                                                        'View Size Chart',
                                                        style: TextStyle(
                                                            color: ColorUtils.black,
                                                            decoration: TextDecoration.underline,
                                                            fontFamily: FontUtils.almarenaRegular,
                                                            fontSize: 14.sp),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 20.h,),
                                                MyButton(
                                                  text: "Select",
                                                  textColor: ColorUtils.white,
                                                  circularRadius: 0,
                                                  onPress: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  });
                            },
                              child: Image.asset(ImageUtils.pencil, scale: 1.6,))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          Text(
            "Select Delivery Method",
            style: TextStyle(
                color: ColorUtils.dividerColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontUtils.almarenaBold,
                fontSize: 16.sp),),
          SizedBox(height: 15.h,),
          InkWell(
            onTap: (){
              setState(() {
                quick = true;
                same = false;
                standard = false;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(quick == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,),
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
          ),
          SizedBox(height: 10.h,),
          Visibility(
            visible: IsReview == true ? false : true,
            child: InkWell(
              onTap: (){
                setState(() {
                  quick = false;
                  same = true;
                  standard = false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(same == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,),
                      SizedBox(width: 5.w,),
                      Text(
                        "Same Day Delivery (24 hours), within Riyadh ",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 13.sp),),
                    ],
                  ),
                  Text(
                    "20 SAR",
                    style: TextStyle(
                        color: ColorUtils.dividerColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 14.sp),),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Visibility(
            visible: IsReview == true ? false : true,
            child: InkWell(
              onTap: (){
                setState(() {
                  quick = false;
                  same = false;
                  standard = true;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(standard == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,),
                      SizedBox(width: 5.w,),
                      Text(
                        "Standard Delivery (1 - 2 days), within Riyadh KSA",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 13.sp),),
                    ],
                  ),
                  Text(
                    "20 SAR",
                    style: TextStyle(
                        color: ColorUtils.dividerColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 14.sp),),
                ],
              ),
            ),
          ),
          Visibility(
              visible: IsReview == true ? false : true,
              child: SizedBox(height: 15.h,)),
          Visibility(
            visible: IsReview == true ? false : true,
            child: Text(
              "Add Promo Code",
              style: TextStyle(
                  color: ColorUtils.dividerColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontUtils.almarenaBold,
                  fontSize: 16.sp),),
          ),
          Visibility(
              visible: IsReview == true ? false : true,
              child: SizedBox(height: 5.h,)),
          Visibility(
            visible: IsReview == true ? false : true,
            child: EditText(
              context: context,
              hintText: "Promo Code",
              // validator: validateEmail,
              // controller: emailTextController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              // currentFocus: _focusNodes[2],
              bordercolor: ColorUtils.white,
              // labelText: StringUtils.EMAIL,
              onSaved: (text) {
                // Email = text;
              },
              onChange: (text) {
                // Email = text;
              },
            ),
          ),
          Visibility(
              visible: IsReview == true ? false : true,
              child: SizedBox(height: 30.h,)),
          SizedBox(height: 10.h,),
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
                    fontWeight: FontWeight.w400,
                    fontFamily: FontUtils.almarenaRegular,
                    fontSize: 14.sp),),
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

          Visibility(
            visible: IsReview == true ? false : true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        useRootNavigator: true,
                        builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setstate){
                          return Container(
                            height: 350.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Delivery Address",
                                    style: TextStyle(
                                        color: ColorUtils.black,
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp),
                                  ),
                                  SizedBox(height: 20.h,),
                                  InkWell(
                                    onTap: (){
                                      setstate(() {
                                        address1 = true;
                                        address2 = false;
                                        address3 = false;

                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Home1",
                                              style: TextStyle(
                                                  color: ColorUtils.dividerColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontUtils.almarenaRegular,
                                                  fontSize: 14.sp),),
                                            SizedBox(height: 5.h,),
                                            Text(
                                              "House Number 1, abc road, xyz area, Riyadh",
                                              style: TextStyle(
                                                  color: ColorUtils.hintColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontUtils.almarenaRegular,
                                                  fontSize: 14.sp),),
                                          ],
                                        ),
                                        Image.asset(address1 == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15.h,),
                                  InkWell(
                                    onTap: (){
                                      setstate(() {
                                        address1 = false;
                                        address2 = true;
                                        address3 = false;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Home2",
                                              style: TextStyle(
                                                  color: ColorUtils.dividerColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontUtils.almarenaRegular,
                                                  fontSize: 14.sp),),
                                            SizedBox(height: 5.h,),
                                            Text(
                                              "House Number 1, abc road, xyz area, Riyadh",
                                              style: TextStyle(
                                                  color: ColorUtils.hintColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontUtils.almarenaRegular,
                                                  fontSize: 14.sp),),
                                          ],
                                        ),
                                        Image.asset(address2 == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15.h,),
                                  InkWell(
                                    onTap: (){
                                      setstate(() {
                                        address1 = false;
                                        address2 = false;
                                        address3 = true;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Home3",
                                              style: TextStyle(
                                                  color: ColorUtils.dividerColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontUtils.almarenaRegular,
                                                  fontSize: 14.sp),),
                                            SizedBox(height: 5.h,),
                                            Text(
                                              "House Number 1, abc road, xyz area, Riyadh",
                                              style: TextStyle(
                                                  color: ColorUtils.hintColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontUtils.almarenaRegular,
                                                  fontSize: 14.sp),),
                                          ],
                                        ),
                                        Image.asset(address3 == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Divider(
                                    height: 10.h,
                                    color: ColorUtils.hintColor,
                                    thickness: 2,
                                  ),
                                  SizedBox(height: 15.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(builder: (context) =>
                                          AddAddressScreen())).then((value){
                                        setState(() {
                                          if(value == "review"){
                                            IsReview = true;
                                            title = "Review Order";
                                          }
                                        });
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Add a New Address",
                                          style: TextStyle(
                                              color: ColorUtils.black,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: FontUtils.almarenaRegular,
                                              fontSize: 14.sp),),
                                        Image.asset(ImageUtils.empty_checkbox, scale: 3,)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                      setState(() {
                                        IsReview = true;
                                        title = "Review Order";
                                      });
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
                                              "Secure Checkout",
                                              style: TextStyle(
                                                  color: ColorUtils.white,
                                                  fontFamily: FontUtils.almarenaRegular,
                                                  fontSize: 20.sp),
                                            ),
                                            SizedBox(width: 5.w,),
                                            Image.asset(ImageUtils.lock, scale: 3,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    });
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
                            "Add Delivery Details",
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
                SizedBox(height: 10.h,),
                InkWell(
                  onTap: (){
                    Navigator.of(context, rootNavigator: true)
                        .pushReplacement(MaterialPageRoute(builder: (context) =>
                        HomeScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 42.h,
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      border: Border.all(
                        width: 1,
                        color: ColorUtils.dividerColor,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Continue Shopping",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),
              ],
            ),
          ),
          Visibility(
            visible: IsReview,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Delivery To",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontUtils.almarenaBold,
                          fontSize: 16.sp),),
                    InkWell(
                      onTap: (){
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) =>
                            AddAddressScreen()));
                      },
                        child: Image.asset(ImageUtils.pencil, scale: 1.8,))
                  ],
                ),
                SizedBox(height: 10.h,),
                Text(
                  "House # 1, abc street, xyz area, riyadh",
                  style: TextStyle(
                      color: ColorUtils.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 14.sp),),
                // SizedBox(height: 15.h,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Select Payment Method",
                //       style: TextStyle(
                //           color: ColorUtils.black,
                //           fontWeight: FontWeight.w400,
                //           fontFamily: FontUtils.almarenaBold,
                //           fontSize: 16.sp),),
                //     InkWell(
                //       onTap: (){
                //         Navigator.of(context, rootNavigator: true)
                //             .push(MaterialPageRoute(builder: (context) =>
                //             AddPaymentMethodScreen())).then((value){
                //               if(value == "card"){
                //                 setState(() {
                //                   cardSelected = true;
                //                 });
                //               }
                //               else{
                //                 setState(() {
                //                   cardSelected = false;
                //                 });
                //               }
                //         });
                //       },
                //       child: Icon(
                //         cardSelected == true ? Icons.edit : Icons.add,
                //         color: ColorUtils.dividerColor,
                //         size: 20.0,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 15.h,),
                // Visibility(
                //   visible: cardSelected,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text(
                //         "**** **** **** 1234",
                //         style: TextStyle(
                //             color: ColorUtils.dividerColor,
                //             fontFamily: FontUtils.almarenaRegular,
                //             fontSize: 18.sp),
                //       ),
                //       SizedBox(width: 5.w,),
                //       Image.asset(ImageUtils.master, scale: 2.5,),
                //     ],
                //   ),
                // ),
                SizedBox(height: 50.h,),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      useRootNavigator: true,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (BuildContext context, StateSetter setstate){
                            return Container(
                              height: 250.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        setstate(() {
                                          bycard = true;
                                          byTabby = false;
                                          byTamara = false;
                                          byApple = false;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Add Credit / Debit Card",
                                                style: TextStyle(
                                                    color: ColorUtils.dividerColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: FontUtils.almarenaRegular,
                                                    fontSize: 14.sp),),
                                              SizedBox(width: 10.w,),
                                              Image.asset(ImageUtils.master, scale: 3,),
                                              SizedBox(width: 5.w,),
                                              Image.asset(ImageUtils.visa, scale: 3,),
                                              SizedBox(width: 5.w,),
                                              Image.asset(ImageUtils.mada, scale: 3,),
                                            ],
                                          ),
                                          Image.asset(bycard == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15.h,),
                                    InkWell(
                                      onTap: (){
                                        setstate(() {
                                          bycard = false;
                                          byTabby = true;
                                          byTamara = false;
                                          byApple = false;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Instalments with Tabby",
                                                style: TextStyle(
                                                    color: ColorUtils.dividerColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: FontUtils.almarenaRegular,
                                                    fontSize: 14.sp),),
                                              SizedBox(width: 10.w,),
                                              Image.asset(ImageUtils.tabby, scale: 3,)
                                            ],
                                          ),
                                          Image.asset(byTabby == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15.h,),
                                    InkWell(
                                      onTap: (){
                                        setstate(() {
                                          bycard = false;
                                          byTabby = false;
                                          byTamara = true;
                                          byApple = false;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Instalments with Tamara",
                                                style: TextStyle(
                                                    color: ColorUtils.dividerColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: FontUtils.almarenaRegular,
                                                    fontSize: 14.sp),),
                                              SizedBox(width: 10.w,),
                                              Image.asset(ImageUtils.tamara, scale: 3,)
                                            ],
                                          ),
                                          Image.asset(byTamara == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15.h,),
                                    InkWell(
                                      onTap: (){
                                        setstate(() {
                                          bycard = false;
                                          byTabby = false;
                                          byTamara = false;
                                          byApple = true;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Apple Pay",
                                                style: TextStyle(
                                                    color: ColorUtils.dividerColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: FontUtils.almarenaRegular,
                                                    fontSize: 14.sp),),
                                              SizedBox(width: 10.w,),
                                              Image.asset(ImageUtils.apple_pay, scale: 3,)
                                            ],
                                          ),
                                          Image.asset(byApple == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 40.h,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                        Navigator.of(context, rootNavigator: true)
                                            .push(MaterialPageRoute(builder: (context) =>
                                            AddPaymentMethodScreen()));
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
                                                "Secure Checkout",
                                                style: TextStyle(
                                                    color: ColorUtils.white,
                                                    fontFamily: FontUtils.almarenaRegular,
                                                    fontSize: 20.sp),
                                              ),
                                              SizedBox(width: 5.w,),
                                              Image.asset(ImageUtils.lock, scale: 3,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                    // Navigator.of(context, rootNavigator: false)
                    //     .push(MaterialPageRoute(builder: (context) =>
                    //     CompleteOrderScreen()));
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
                            "Add Payment Method",
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
                SizedBox(height: 20.h,)
              ],
            ),
          )



        ],
      ),
    );
  }


  Widget logsWidget(BuildContext context, Map<String,dynamic> category) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 0,
      runSpacing: 5,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: false)
                .push(MaterialPageRoute(builder: (context) =>
                ProductDetailScreen()));
          },
          child: Container(
            // padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
            height: 250.h,
            width: 160.w,
            decoration: BoxDecoration(
              color: ColorUtils.listColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: 190.h,
                        width: 170.w,
                        child: Image.asset(category["image"], fit: BoxFit.fill,)),
                  ],
                ),

                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "AWAKE MODE",
                        style: TextStyle(
                            color: ColorUtils.hintColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 12.sp),
                      ),
                      Image.asset(ImageUtils.heart, scale: 2,)
                    ],
                  ),
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    category["title"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: ColorUtils.black,
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    category["amount"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: ColorUtils.dividerColor,
                        fontFamily: FontUtils.almarenaRegular
                        ,
                        fontSize: 12.sp),
                  ),
                )
              ],
            ),
          ),
        )
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
