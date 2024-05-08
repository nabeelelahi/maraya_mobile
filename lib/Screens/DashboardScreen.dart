import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:maraya_flutter/main.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({ Key? key }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool menSelected = false;
  bool womenSelected = true;
  List<String> categories = [ImageUtils.feature4, ImageUtils.feature1];
  List<String> brands = [ImageUtils.brand_demo, ImageUtils.feature1];
  bool product = true;


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

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 10.w,
        title: Text("Hello Alexa") ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaBold , fontSize: 25.sp),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: (){},
            child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Image.asset(ImageUtils.person,
                  scale: 2.5,)),
          ),
          InkWell(
            onTap: (){},
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
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: body()),
      ),
    );
  }


  Widget body(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    if(menSelected){
                      womenSelected = false;
                    }
                    else{
                      menSelected = true;
                      womenSelected = false;
                    }
                  });
                },
                child: Container(
                  color: menSelected == true ? ColorUtils.black : ColorUtils.containerColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        translate('strings.Men'),
                        style: TextStyle(
                            fontFamily: FontUtils.almarenaRegular,
                            color: menSelected == true ? ColorUtils.white : ColorUtils.dividerColor,
                            fontSize: 18.sp,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.w,),
              InkWell(
                onTap: (){
                  setState(() {
                    if(womenSelected){
                      menSelected = false;
                    }
                    else{
                      womenSelected = true;
                      menSelected = false;
                    }
                  });
                },
                child: Container(
                  color: womenSelected == true ? ColorUtils.black : ColorUtils.containerColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        translate('strings.Women'),
                        style: TextStyle(
                            fontFamily: FontUtils.almarenaRegular,
                            color: womenSelected == true ? ColorUtils.white : ColorUtils.dividerColor,
                            fontSize: 18.sp,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        carouselWidget(context, [ImageUtils.feature5, ImageUtils.feature5, ImageUtils.feature5 ]),
        SizedBox(height: 35.h,),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                          color: ColorUtils.dividerColor,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 25.sp),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: ColorUtils.dividerColor,
                          fontFamily: FontUtils.almarenaDisplayRegular,
                          fontSize: 40.sp),
                    ),
                  ],
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      color: ColorUtils.black,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorUtils.dotGreen,
                      decorationThickness: 3.0,
                      fontFamily: FontUtils.almarenaDisplayRegular,
                      fontSize: 16.sp),
                ),
              ],
            )
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            height: 310.h,
            width: double.infinity,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 10.w,),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "02",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 20.sp),
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                        width: 10.w,
                      ),
                      Text(
                        "01",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 20.sp),
                      ),

                    ],
                  ),
                ),
                SizedBox(width: 20.w,),
                Expanded(
                  child: SizedBox(
                    height: 310.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10.w,),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 280.h,
                              child: Image.asset(categories[index]),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              "Category Name",
                              style: TextStyle(
                                  color: ColorUtils.dividerColor,
                                  fontFamily: FontUtils.almarenaRegular,
                                  fontSize: 22.sp),
                            ),
                          ],
                        );
                      },
                      itemCount: categories.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            height: 250.h,
            child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    height: 250.h,
                    child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 10),
                        fadeInCurve: Curves.easeInExpo,
                        fadeOutCurve: Curves.easeOutExpo,
                        placeholder: Image.asset(ImageUtils.loading_placeholder, fit: BoxFit.fill ).image,
                        image: Image.asset(ImageUtils.feature3 ?? "",fit: BoxFit.fill,).image,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Container(child: Image.asset(ImageUtils.loading_placeholder, fit: BoxFit.fill));
                        },
                        fit: BoxFit.fill),
                  ),
                  Container(
                    color: ColorUtils.black.withOpacity(0.10),
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: -35.h,
                    left: 15.w,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 140.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Mood:\nVintage Americana",
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 25.sp),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  "From understated luxury to enduring sophistication, find the perfect pieces.",
                                  style: TextStyle(
                                      color: ColorUtils.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontUtils.almarenaRegular,
                                      fontSize: 16.sp),
                                ),
                              ),
                              Text(
                                "Shop Now",
                                style: TextStyle(
                                    color: ColorUtils.white,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorUtils.dotGreen,
                                    decorationThickness: 3.0,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 16.sp),),
                            ],
                          )


                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
        SizedBox(height: 30.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            // color: ColorUtils.blue,
            width: double.infinity,
            height: 330.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Feature Products",
                          style: TextStyle(
                              color: ColorUtils.black,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 25.sp),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                              color: ColorUtils.black,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorUtils.dotGreen,
                              decorationThickness: 3.0,
                              fontFamily: FontUtils.almarenaDisplayRegular,
                              fontSize: 16.sp),
                        ),
                      ],
                    )
                ),
                SizedBox(height: 15.h,),
                SizedBox(
                  height: 255.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10.w,),
                    itemBuilder: (BuildContext context, int index) {
                      return logsWidget(context, categories1[index]);
                    },
                    itemCount: categories1.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                          color: ColorUtils.dividerColor,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 25.sp),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "Brands",
                      style: TextStyle(
                          color: ColorUtils.dividerColor,
                          fontFamily: FontUtils.almarenaDisplayRegular,
                          fontSize: 40.sp),
                    ),
                  ],
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      color: ColorUtils.black,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorUtils.dotGreen,
                      decorationThickness: 3.0,
                      fontFamily: FontUtils.almarenaDisplayRegular,
                      fontSize: 16.sp),
                ),
              ],
            )
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            height: 310.h,
            width: double.infinity,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 10.w,),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "02",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 20.sp),
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                        width: 10.w,
                      ),
                      Text(
                        "01",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 20.sp),
                      ),

                    ],
                  ),
                ),
                SizedBox(width: 20.w,),
                Expanded(
                  child: SizedBox(
                    height: 310.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10.w,),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 280.h,
                              child: Image.asset(brands[index]),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              "Brand Name",
                              style: TextStyle(
                                  color: ColorUtils.dividerColor,
                                  fontFamily: FontUtils.almarenaRegular,
                                  fontSize: 22.sp),
                            ),
                          ],
                        );
                      },
                      itemCount: brands.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(ImageUtils.mulabis_image),
                    Positioned(
                      top: 15.h,
                      left: 10.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                            borderRadius:
                            BorderRadius.circular(5.0), //
                        ),
                        child:  Text(
                          "Featured",
                          style: TextStyle(
                              color: ColorUtils.black,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mulabis",
                        style: TextStyle(
                            color: ColorUtils.white,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 22.sp),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Casual Wear - Eastern - Comfy ",
                        style: TextStyle(
                            color: ColorUtils.white,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 15.sp),
                      ),
                      SizedBox(height: 30.h,),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                        style: TextStyle(
                            color: ColorUtils.white,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 12.sp),
                      ),
                      SizedBox(height: 30.h,),
                      Text(
                        "Shop Now",
                        style: TextStyle(
                            color: ColorUtils.white,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorUtils.dotGreen,
                            decorationThickness: 3.0,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 16.sp),),
                      SizedBox(height: 15.h,),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 30.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            height: 250.h,
            child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    height: 250.h,
                    child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 10),
                        fadeInCurve: Curves.easeInExpo,
                        fadeOutCurve: Curves.easeOutExpo,
                        placeholder: Image.asset(ImageUtils.loading_placeholder, fit: BoxFit.fill ).image,
                        image: Image.asset(ImageUtils.timeless_image ?? "",fit: BoxFit.fill,).image,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Container(child: Image.asset(ImageUtils.loading_placeholder, fit: BoxFit.fill));
                        },
                        fit: BoxFit.fill),
                  ),
                  Container(
                    color: ColorUtils.black.withOpacity(0.10),
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: -35.h,
                    left: 15.w,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 140.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Timeless Classics",
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 25.sp),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  "From understated luxury to enduring sophistication, find the perfect pieces.",
                                  style: TextStyle(
                                      color: ColorUtils.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontUtils.almarenaRegular,
                                      fontSize: 16.sp),
                                ),
                              ),
                              Text(
                                "Shop Now",
                                style: TextStyle(
                                    color: ColorUtils.white,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorUtils.dotGreen,
                                    decorationThickness: 3.0,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 16.sp),),
                            ],
                          )


                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
        SizedBox(height: 30.h,),
        Container(
          color: ColorUtils.black,
          width: double.infinity,
          // height: 720.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageUtils.about_armani),
                SizedBox(height: 15.h,),
                Text(
                  "About Maraya",
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
                            "Talk to Us",
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
                SizedBox(height: 40.h,),
                Text(
                  "Visit our Outlet in Riyadh",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorUtils.white,
                      fontFamily: FontUtils.almarenaRegular,
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp),
                ),
                SizedBox(height: 15.h,),
                Image.asset(ImageUtils.map),
                SizedBox(height: 25.h,),
                Center(
                  child: Text(
                    "Follow us on Socials",
                    style: TextStyle(
                        color: ColorUtils.white,
                        fontFamily: FontUtils.almarenaRegular,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(height: 20.h,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ImageUtils.instagram_image, scale: 3,),
                      SizedBox(width: 40.w,),
                      Image.asset(ImageUtils.facebook_image, scale: 3,),
                      SizedBox(width: 40.w,),
                      Image.asset(ImageUtils.tiktok_image, scale: 3,),
                      SizedBox(width: 40.w,),
                      Image.asset(ImageUtils.snapchat_image, scale: 3,),
                    ],
                  ),
                ),
                SizedBox(height: 30.h,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Quick Links",
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 14.sp),
                          ),
                          Icon(
                            product == false ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 5,
                      color: ColorUtils.white,
                      thickness: 2,
                    ),
                    Visibility(
                      visible: product,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h,),
                          Text(
                            "Customer Service",
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 14.sp),
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            "Payment",
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 14.sp),
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            "Shipping",
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 14.sp),
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            "Returns & Exchange",
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 14.sp),
                          ),
                          SizedBox(height: 20.h,),
                        ],
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }


  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<Map<String,dynamic>> categories1 = [];
  Widget carouselWidget(BuildContext context, List<String> bannersList) {
    final controller = PageController();
    var img = bannersList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.topCenter, children: [
            CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: 200.h,
                enlargeCenterPage: true,
                viewportFraction: 1,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (position, reason) {
                  debugPrint(reason.toString());
                  print(CarouselPageChangedReason.controller);
                  _current = position;
                  if(mounted){
                    setState(() {});
                  }

                },
                enableInfiniteScroll: true,
              ),
              items: img.map<Widget>((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            height: 250.h,
                            child: FadeInImage(
                                fadeInDuration: const Duration(milliseconds: 10),
                                fadeInCurve: Curves.easeInExpo,
                                fadeOutCurve: Curves.easeOutExpo,
                                placeholder: Image.asset(ImageUtils.loading_placeholder, fit: BoxFit.fill ).image,
                                image: Image.asset(i ?? "",fit: BoxFit.fill,).image,
                                imageErrorBuilder: (context, error, stackTrace) {
                                  return Container(child: Image.asset(ImageUtils.loading_placeholder, fit: BoxFit.fill));
                                },
                                fit: BoxFit.fill),
                          ),
                          Container(
                            color: ColorUtils.black.withOpacity(0.10),
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: -55.h,
                            left: 15.w,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 140.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                    style: TextStyle(
                                        color: ColorUtils.white,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 20.sp),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "Shop Now",
                                    style: TextStyle(
                                        color: ColorUtils.white,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ColorUtils.dotGreen,
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 16.sp),),
                                ],
                              ),
                            ),
                          )
                        ]);
                  },
                );
              }).toList(),
            ),
          ]),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: img.asMap().entries.map((entry) {
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
      )
    );
  }
  Widget logsWidget(BuildContext context, Map<String,dynamic> category) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 5.w),
        height: 230.h,
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
    );
  }


}