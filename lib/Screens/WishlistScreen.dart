import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:maraya_flutter/Screens/FilterScreen.dart';
import 'package:maraya_flutter/Screens/ProductDetailScreen.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';

class WishlistScreen extends StatefulWidget {
  static const String route = "WishlistScreen";
  bool? show;
  WishlistScreen({Key? key,this.show}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  List<Map<String,dynamic>> categories = [];
  List<Map<String,dynamic>> sort = [];
  List<Map<String,dynamic>> filterlist = [];
  bool show = false;


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    categories =[
      {
        "title": "Asymmetric Draped Maxi... ",
        "amount": "5,000 SAR",
        "image": ImageUtils.cloth1,
      },
      {
        "title": "Nautical Print Mini Skirt in...",
        "amount": "4,000 SAR",
        "image": ImageUtils.cloth2,
      },

      {
        "title": "Milano Stamp Crop Hood...",
        "amount": "5,000 SAR",
        "image": ImageUtils.cloth3,
      },
      {
        "title": "Diamond Abaya Set in Cr...",
        "amount": "4,000 SAR",
        "image": ImageUtils.cloth4,
      },
      {
        "title": "Asymmetric Draped Maxi... ",
        "amount": "5,000 SAR",
        "image": ImageUtils.cloth1,
      },
      {
        "title": "Nautical Print Mini Skirt in...",
        "amount": "4,000 SAR",
        "image": ImageUtils.cloth2,
      },
    ];
    sort =[
      {
        "title": "Popular",
        "state": false
      },
      {
        "title": "Newest",
        "state": false
      },
      {
        "title": "Price: lowest to high",
        "state": false
      },
      {
        "title": "Price: highest to low",
        "state": false
      },
    ];
    filterlist =[
      {
        "title": "Clothing",
        "state": false
      },
      {
        "title": "Dresses",
        "state": false
      },
      {
        "title": "Armani",
        "state": false
      },
      {
        "title": "Party",
        "state": false
      },
      {
        "title": "2XS",
        "state": false
      },
      {
        "title": "2XL",
        "state": false
      },
      {
        "title": "XL",
        "state": false
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: WishlistScreen');
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
            size: 15.0,
          ),
        ),
        titleSpacing: -12.w,
        title: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Text("Wish List")) ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaBold , fontSize: 25.sp),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: (){
            },
            child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Image.asset(ImageUtils.cart_black,
                  scale: 2.5,)),
          ),
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
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: GridView.builder(
            padding: EdgeInsets.only(bottom: 3.h),
            itemCount: categories.length,
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
        SizedBox(height: 130.h,)

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
                        "ARMANI",
                        style: TextStyle(
                            color: ColorUtils.hintColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 12.sp),
                      ),
                      Image.asset(ImageUtils.heart_red, scale: 3.5,)
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
}
