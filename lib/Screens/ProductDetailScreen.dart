import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:maraya_flutter/Screens/CartScreen.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';
import 'HomeScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String route = "ProductDetailScreen";

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  List<Map<String,dynamic>> categories = [];
  List<Map<String,dynamic>> categories1 = [];
  List<Map<String,dynamic>> categories2 = [];
  List<Map<String,dynamic>> colors = [];
  List<Map<String,dynamic>> sizes = [];
  final CarouselController _controller = CarouselController();
  int _current = 0;
  bool product = false;
  bool care = false;
  bool shipping = false;
  bool refund = false;
  bool checkout = false;
  bool soldout = false;
  ScrollController scrollController = ScrollController();


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    categories =[
      {
        "title": "Premium Shoes",
        "amount": "1,000 SAR",
        "image": ImageUtils.cloth11,
      },
      {
        "title": "Premium Bracelet",
        "amount": "2,000 SAR",
        "image": ImageUtils.cloth9,
      },
    ];
    categories1 =[
      {
        "title": "Premium Shoes",
        "amount": "1,000 SAR",
        "image": ImageUtils.cloth2,
      },
      {
        "title": "Premium Cloth",
        "amount": "2,000 SAR",
        "image": ImageUtils.cloth3,
      },
    ];
    categories2 =[
      {
        "title": "Milano Stamp Crop Hood...",
        "amount": "1,000 SAR",
        "image": ImageUtils.cloth8,
      },
      {
        "title": "Diamond Abaya Set in Cr...",
        "amount": "2,000 SAR",
        "image": ImageUtils.cloth7,
      },
    ];
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
    print('State: ProductDetailScreen');
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20.0,
          ),
        ),
        titleSpacing: -13.w,
        title: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Text("ARMANI")) ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaBold , fontSize: 25.sp),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context, rootNavigator: true)
                  .pushReplacement(MaterialPageRoute(builder: (context) =>
                  HomeScreen(index: 3,)));
            },
            child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Image.asset(ImageUtils.cart_black,
                  scale: 1.7,)),
          ),
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          controller: scrollController,
            physics: ClampingScrollPhysics(),
            child: body()),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        CustomcarouselWidget(context, [ImageUtils.cloth1, ImageUtils.cloth7, ImageUtils.cloth10 ]),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300.w,
                child: Text(
                  "Asymmetric Draped Maxi Dress in Sequins",
                  style: TextStyle(
                      color: ColorUtils.black,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 26.sp),
                ),
              ),
              Image.asset(ImageUtils.heart, scale: 1.4,)
            ],
          ),
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 140.w,
                child: Text(
                  "1,000 SAR",
                  style: TextStyle(
                      color: ColorUtils.black,
                      fontFamily: FontUtils.almarenaDisplayRegular,
                      fontSize: 22.sp),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImageUtils.minus, scale: 4, color: soldout ? ColorUtils.hintColor : ColorUtils.black,),
                  SizedBox(width: 10.w,),
                  Text(
                    "1",
                    style: TextStyle(
                        color: ColorUtils.black,
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 22.sp),
                  ),
                  SizedBox(width: 10.w,),
                  Image.asset(ImageUtils.plus, scale: 4, color: soldout ? ColorUtils.hintColor : ColorUtils.black,)
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
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
        ),
        SizedBox(height: 15.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
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
                        soldout = false;
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
                        soldout = false;
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
                        checkout = false;
                        soldout = true;
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
                        soldout = false;
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
                        soldout = false;
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
                        checkout = false;
                        soldout = true;
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
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: 'This model is 6ft tall and is wearing size L. ',
                style: TextStyle(
                    color: ColorUtils.black,
                    fontFamily: FontUtils.almarenaRegular,
                    fontSize: 14.sp),
                children: <TextSpan>[
                  TextSpan(text: 'View Size Chart',
                      style: TextStyle(
                          color: ColorUtils.black,
                          decoration: TextDecoration.underline,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 13.sp),
                  )
                ]
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: InkWell(
            onTap: (){
              if(soldout){
                showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  builder: (context) {
                    return Container(
                      height: 150.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 300.w,
                                    child: Text(
                                      "We apologize but this item is currently out of stock. We will notify you once it is restocked  ",
                                      style: TextStyle(
                                          color: ColorUtils.dividerColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontUtils.almarenaDisplayLight,
                                          fontSize: 18.sp),),
                                  ),
                                  // InkWell(
                                  //   onTap: (){
                                  //     Navigator.pop(context);
                                  //   },
                                  //     child: Image.asset(ImageUtils.cross, scale: 1.6,))
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h,),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 42.h,
                                color: ColorUtils.dividerColor,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Notify Me",
                                        style: TextStyle(
                                            color: ColorUtils.white,
                                            fontFamily: FontUtils.almarenaDisplayRegular,
                                            fontSize: 20.sp),
                                      ),
                                      SizedBox(width: 10.w,),
                                      Image.asset(ImageUtils.bell, scale: 1.6, color: ColorUtils.white,)
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
              }
              else{
                setState(() {
                  checkout = true;
                  scrollController.animateTo( //go to top of scroll
                      0,  //scroll offset to go
                      duration: Duration(milliseconds: 500), //duration of scroll
                      curve:Curves.fastOutSlowIn //scroll type
                  );
                });
              }

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
                      soldout ? "Out of Stock" : "Add to Bag",
                      style: TextStyle(
                          color: ColorUtils.white,
                          fontFamily: FontUtils.almarenaDisplayRegular,
                          fontSize: 20.sp),
                    ),
                    SizedBox(width: 10.w,),
                    Image.asset(ImageUtils.bag, scale: 1.6, color: ColorUtils.white,)
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImageUtils.van, scale: 1.7,),
              SizedBox(width: 10.w,),
              Text(
                "3 hours delivery in Riyadh. ",
                style: TextStyle(
                    color: ColorUtils.black,
                    fontFamily: FontUtils.almarenaDisplayRegular,
                    fontSize: 16.sp),
              ),
            ],
          )
        ),
        SizedBox(height: 10.h,),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageUtils.clock, scale: 1.7,),
                SizedBox(width: 10.w,),
                Text(
                  "24 hours return ",
                  style: TextStyle(
                      color: ColorUtils.black,
                      fontFamily: FontUtils.almarenaDisplayRegular,
                      fontSize: 16.sp),
                ),
              ],
            )
        ),
        SizedBox(height: 18.h,),
        InkWell(
          onTap: (){
            setState(() {
              if(product){
                product = false;
              }
              else{
                product = true;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      product == false ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      "Product Description",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
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
        Visibility(
          visible: product,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        InkWell(
          onTap: (){
            setState(() {
              if(care){
                care = false;
              }
              else{
                care = true;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      care == false ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      "Product Care",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
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
        Visibility(
          visible: care,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        InkWell(
          onTap: (){
            setState(() {
              if(shipping){
                shipping = false;
              }
              else{
                shipping = true;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      shipping == false ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      "Shipping Information",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
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
        Visibility(
          visible: shipping,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        InkWell(
          onTap: (){
            setState(() {
              if(refund){
                refund = false;
              }
              else{
                refund = true;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      refund == false ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      "Returns and Exchange",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
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
        Visibility(
          visible: refund,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorUtils.hintColor,
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            width: double.infinity,
            height: 42.h,
            decoration: BoxDecoration(
              color: ColorUtils.white,
              border: Border.all(
                width: 1.5,
                color: Colors.black,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ask us Anything",
                    style: TextStyle(
                        color: ColorUtils.black,
                        fontFamily: FontUtils.almarenaDisplayRegular,
                        fontSize: 20.sp),
                  ),
                  SizedBox(width: 10.w,),
                  Image.asset(ImageUtils.whatsapp, scale: 1.6, color: ColorUtils.black,)
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h,),
        Container(
          color: ColorUtils.black,
          width: double.infinity,
          height: 320.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Text(
                  "Buy the Look",
                  style: TextStyle(
                      color: ColorUtils.white,
                      fontFamily: FontUtils.almarenaDisplayRegular,
                      fontSize: 25.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 3.h),
                  itemCount: 2,
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 120.h,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return logsWidget(context, categories[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h,),
        Container(
          color: ColorUtils.white,
          width: double.infinity,
          height: 320.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "More from Armani",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaDisplayRegular,
                          fontSize: 25.sp),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          color: ColorUtils.black,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorUtils.dotGreen,
                          fontFamily: FontUtils.almarenaDisplayRegular,
                          fontSize: 16.sp),
                    ),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 3.h),
                  itemCount: 2,
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 120.h,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return logsWidget(context, categories1[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          color: ColorUtils.white,
          width: double.infinity,
          height: 320.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Explore Dresses",
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: FontUtils.almarenaDisplayRegular,
                            fontSize: 25.sp),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: ColorUtils.black,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorUtils.dotGreen,
                            fontFamily: FontUtils.almarenaDisplayRegular,
                            fontSize: 16.sp),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 3.h),
                  itemCount: 2,
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 120.h,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return logsWidget(context, categories2[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h,),
        Container(
          color: ColorUtils.black,
          width: double.infinity,
          height: 720.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageUtils.banner),
                SizedBox(height: 15.h,),
                Text(
                  "About Armani",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorUtils.white,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 22.sp),
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorUtils.white,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 16.sp),
                ),
                Divider(
                  height: 40,
                  color: ColorUtils.dotGreen,
                  thickness: 2.5,
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Contact Us",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorUtils.white,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 18.sp),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageUtils.whatsapp, scale: 1.7, color: ColorUtils.white,),
                    SizedBox(width: 7.w,),
                    Text(
                      "+966 12 345 678",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorUtils.white,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageUtils.phone, scale: 1.7,),
                    SizedBox(width: 7.w,),
                    Text(
                      "+966 12 345 678",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorUtils.white,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(height: 25.h,),
                Text(
                  "Visit our store",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorUtils.white,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 18.sp),
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Shop#1, Riyadh Street, Riyadh ",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorUtils.white,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 16.sp),
                ),
                SizedBox(height: 10.h,),
                Image.asset(ImageUtils.map)
              ],
            ),
          ),
        ),









        // SizedBox(height: 200.h,),

      ],
    );
  }


  Widget logsWidget(BuildContext context, Map<String,dynamic> category) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 0,
      runSpacing: 5,
      children: [
        GestureDetector(
          onTap: () {},
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
                        "Brand Name",
                        style: TextStyle(
                            color: ColorUtils.hintColor,
                            fontFamily: FontUtils.clashDisplayRegular,
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
                        fontFamily: FontUtils.clashDisplayMedium,
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
                        fontFamily: FontUtils.clashDisplayRegular
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
  Widget CustomcarouselWidget(BuildContext context, List<String> media) {
    final controller = PageController();
    return Column(
      children: [
        Stack(alignment: Alignment.topCenter, children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 350.h,
              enlargeCenterPage: true,
              viewportFraction: 1,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (position, reason) {
                debugPrint(reason.toString());
                print(CarouselPageChangedReason.controller);
                _current = position;
                setState(() {});
              },
              enableInfiniteScroll: false,
            ),
            items: media.map<Widget>((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                      // fit: StackFit.expand,
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned.fill(
                          child: Container(
                            height: 150.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: FadeInImage(
                                  fadeInDuration: const Duration(milliseconds: 10),
                                  fadeInCurve: Curves.easeInExpo,
                                  fadeOutCurve: Curves.easeOutExpo,
                                  placeholder: Image.asset(ImageUtils.loading_placeholder, fit: BoxFit.fill ).image,
                                  image: Image.asset(i,fit: BoxFit.cover,).image,
                                  imageErrorBuilder: (context, error, stackTrace) {
                                    return Container(child: Image.asset(ImageUtils.loading_placeholder, fit: BoxFit.fill));
                                  },
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        checkout == true ? InkWell(
                          onTap: (){
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(MaterialPageRoute(builder: (context) =>
                                HomeScreen(index: 3,)));
                          },
                          child: Container(
                            height: 20.h,
                            width: double.infinity,
                            color: ColorUtils.black,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Added to Bag, Checkout Now",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: ColorUtils.white,
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ) : Container(),
                      ]);
                },
              );
            }).toList(),
          ),
        ]),
        SizedBox(height: 6.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: media.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: _current == entry.key ?
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: (Theme.of(context).brightness == Brightness.light
                          ? ColorUtils.dotGreen
                          : ColorUtils.dividerColor),
                    ),
                  ) :
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: (Theme.of(context).brightness == Brightness.light
                      ? ColorUtils.dividerColor
                      : ColorUtils.dotGreen),
                ),
              )

            );
          }).toList(),
        ),
      ],
    );
  }
}
