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
import 'FilterScreenType.dart';

class FilterScreen extends StatefulWidget {
  static const String route = "FilterScreen";
  bool? back;
  FilterScreen({Key? key,this.back}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  List<Map<String,dynamic>> categories = [];
  bool show = false;


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    categories =[
      {
        "title": "Category",
        "number": "5",
        "shownumber": true,
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Product Type",
        "color": ColorUtils.listColor,
        "state": false,
        "number": "2",
        "shownumber": true,
      },

      {
        "title": "Style",
        "color": ColorUtils.white,
        "state": false,
        "number": "5",
        "shownumber": false,
      },
      {
        "title": "Size",
        "color": ColorUtils.listColor,
        "state": false,
        "number": "5",
        "shownumber": false,
      },

      {
        "title": "Brand",
        "color": ColorUtils.white,
        "state": false,
        "number": "1",
        "shownumber": true,
      },
      {
        "title": "Color",
        "color": ColorUtils.listColor,
        "state": false,
        "number": "5",
        "shownumber": false,
      },
      {
        "title": "Price",
        "color": ColorUtils.white,
        "state": false,
        "number": "5",
        "shownumber": false,
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: FilterScreen');
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
        title: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Text("Apply Filters")) ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaBold , fontSize: 16.sp),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: (){
              setState(() {
                show = false;
              });
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Text(
                  "Reset Filters",
                  style: TextStyle(
                      fontFamily: FontUtils.almarenaRegular,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorUtils.dotGreen,
                      color: ColorUtils.dividerColor,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: InkWell(
          onTap: (){
            Navigator.pop(context, true);
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
                    "Filter",
                    style: TextStyle(
                        color: ColorUtils.white,
                        fontFamily: FontUtils.almarenaDisplayRegular,
                        fontSize: 22.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
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
              Navigator.of(context, rootNavigator: false)
                  .push(MaterialPageRoute(builder: (context) =>
                  FilterScreenType(title: categories[index]["title"],))).then((value){
                    if(value == true){
                      setState(() {
                        show = true;
                      });
                    }
                    else{
                      show = false;
                    }
              });

            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 50.h,
                color: categories[index]["color"],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              categories[index]["title"],
                              style: TextStyle(
                                  color: ColorUtils.dividerColor,
                                  fontFamily: FontUtils.almarenaRegular,
                                  fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Visibility(
                            visible: categories[index]["shownumber"] == true && show == true ? true : false,
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: ColorUtils.containerColor,
                              child: Center(
                                child: Text(
                                  categories[index]["number"],
                                  style: TextStyle(
                                      color: ColorUtils.dividerColor,
                                      fontFamily: FontUtils.almarenaRegular,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: categories[index]["state"] == true ? Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.black,
                          size: 30.0,
                        ) : Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

  }



}
