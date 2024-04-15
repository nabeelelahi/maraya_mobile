import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:maraya_flutter/Screens/BrowseScreen.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';

class CategoriesScreen extends StatefulWidget {
  static const String route = "CategoriesScreen";

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  List<Map<String,dynamic>> categories = [];
  bool menSelected = false;
  bool womenSelected = true;


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    categories =[
      {
        "title": "Clothing",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Shoes",
        "color": ColorUtils.listColor,
        "state": false,
      },

      {
        "title": "Bags",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Jewellery",
        "color": ColorUtils.listColor,
        "state": false,
      },

      {
        "title": "Accessories",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Cosmetics",
        "color": ColorUtils.listColor,
        "state": false,
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: CategoriesScreen');
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 10.w,
        title: Text(translate('strings.BrowseCategories')) ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaRegular , fontSize: 25.sp),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: (){
            },
            child: Padding(
                padding: EdgeInsets.only(top: 1.h, right: 5.w),
                child: Image.asset(ImageUtils.person,
                  scale: 2,)),
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
                child: body())),
      ),
    );
  }

  Widget body() {
    return Column(
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
                  width: 60.w,
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
        _renderSteps(),

      ],
    );
  }


  Widget _renderSteps() {
    return ListView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return  InkWell(
          onTap: (){
            setState(() {
              if(categories[index]["state"] == true){
                categories[index]["state"] = false;
              }
              else{
                categories[index]["state"] = true;
              }

            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 60.h,
                color: categories[index]["color"],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        categories[index]["title"],
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 18.sp),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: categories[index]["state"] == true ? Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.black,
                          size: 30.0,
                        ) : Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: categories[index]["state"],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context, rootNavigator: false)
                          .push(MaterialPageRoute(builder: (context) =>
                          BrowseScreen()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,),
                        Text(
                          "View All",
                          style: TextStyle(
                              color: ColorUtils.black,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          "Fashion Jewellery",
                          style: TextStyle(
                              color: ColorUtils.black,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          "Gold",
                          style: TextStyle(
                              color: ColorUtils.black,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          "Silver",
                          style: TextStyle(
                              color: ColorUtils.black,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          "Earrings",
                          style: TextStyle(
                              color: ColorUtils.black,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );

  }



}
