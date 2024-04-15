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

class FilterScreenType extends StatefulWidget {
  static const String route = "FilterScreenType";
  String? title;
  String? type;
  FilterScreenType({Key? key,this.title, this.type}) : super(key: key);

  @override
  _FilterScreenTypeState createState() => _FilterScreenTypeState();
}

class _FilterScreenTypeState extends State<FilterScreenType> {

  List<Map<String,dynamic>> categories = [];
  List<Map<String,dynamic>> productType = [];
  List<Map<String,dynamic>> brand = [];
  List<Map<String,dynamic>> style = [];
  List<Map<String,dynamic>> size = [];
  List<Map<String,dynamic>> color = [];
  List<Map<String,dynamic>> main = [];
  double startval = 0, endval = 0.5;
  double startval1 = 50, endval1 = 10000;


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
        "title": "Bag",
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
      {
        "title": "Watches",
        "color": ColorUtils.white,
        "state": false,
      },
    ];
    productType =[
      {
        "title": "Dresses",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Abayas",
        "color": ColorUtils.listColor,
        "state": false,
      },

      {
        "title": "Activewear",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Beachwear",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "Pants",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Swimwear",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "Longwear",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Skirts",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "Shorts",
        "color": ColorUtils.white,
        "state": false,
      },
    ];
    brand =[
      {
        "title": "Armani",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Abercrombie and Fitch",
        "color": ColorUtils.listColor,
        "state": false,
      },

      {
        "title": "ADPT",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "AllSaints",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "Alpha Industries",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Another Influence",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "ASOS 4505",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "ASOS Design",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "Barbour International",
        "color": ColorUtils.white,
        "state": false,
      },
    ];
    style =[
      {
        "title": "Party",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Office",
        "color": ColorUtils.listColor,
        "state": false,
      },

      {
        "title": "Wedding",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Beach",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "Formal",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Semi Formal",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "Casual",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Travelling",
        "color": ColorUtils.listColor,
        "state": false,
      },
    ];
    size =[
      {
          "title": "2XS",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "XS",
        "color": ColorUtils.listColor,
        "state": false,
      },

      {
        "title": "S",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "M",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "L",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "XL",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "2XL",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "3XL",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "4XL",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "5XL",
        "color": ColorUtils.listColor,
        "state": false,
      },
      {
        "title": "W24",
        "color": ColorUtils.white,
        "state": false,
      },
      {
        "title": "W24 L30",
        "color": ColorUtils.listColor,
        "state": false,
      },
    ];
    color =[
      {
        "title": "White",
        "color": ColorUtils.listColor,
        "shade": ColorUtils.white,
        "state": false,
      },
      {
        "title": "Black",
        "color": ColorUtils.white,
        "shade": ColorUtils.black,
        "state": false,
      },
      {
        "title": "Gray",
        "color": ColorUtils.listColor,
        "shade": ColorUtils.colorgrey,
        "state": false,
      },
      {
        "title": "Off White",
        "color": ColorUtils.white,
        "shade": ColorUtils.coloroffwhite,
        "state": false,
      },
      {
        "title": "Red",
        "color": ColorUtils.listColor,
        "shade": ColorUtils.colorred,
        "state": false,
      },
      {
        "title": "Maroon",
        "color": ColorUtils.white,
        "shade": ColorUtils.colormaroon,
        "state": false,
      },
      {
        "title": "Brown",
        "color": ColorUtils.listColor,
        "shade": ColorUtils.colorbrown,
        "state": false,
      },
      {
        "title": "Dark Blue",
        "color": ColorUtils.white,
        "shade": ColorUtils.colordarkblue,
        "state": false,
      },
      {
        "title": "Light Blue",
        "color": ColorUtils.listColor,
        "shade": ColorUtils.colorlightblue,
        "state": false,
      },
      {
        "title": "Yellow",
        "color": ColorUtils.white,
        "shade": ColorUtils.coloryellow,
        "state": false,
      },
      {
        "title": "Gold",
        "color": ColorUtils.listColor,
        "shade": ColorUtils.colorgold,
        "state": false,
      },
      {
        "title": "Green",
        "color": ColorUtils.white,
        "shade": ColorUtils.colorgreen,
        "state": false,
      },
    ];

    if(widget.title == "Category"){
      setState(() {
        main = categories;
      });
    }
    else if(widget.title == "Product Type"){
      setState(() {
        main = productType;
      });
    }
    else if(widget.title == "Brand"){
      setState(() {
        main = brand;
      });
    }
    else if(widget.title == "Style"){
      setState(() {
        main = style;
      });
    }
    else if(widget.title == "Size"){
      setState(() {
        main = size;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: FilterScreenType');
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
        title: Text("Filter by ${widget.title ?? ""}") ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaBold , fontSize: 16.sp),
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
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
    return widget.title == "Price" ? Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "Price Range",
            style: TextStyle(
                color: ColorUtils.dividerColor,
                fontFamily: FontUtils.almarenaRegular,
                fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 10.h,),
        RangeSlider(
          min: 50,
          max: 50000,
          divisions: 10, //slide interval
          labels: RangeLabels("SAR. $startval1", "SAR. $endval1"),
          values: RangeValues(startval1, endval1),
          activeColor: ColorUtils.dividerColor,
          inactiveColor: ColorUtils.hintColor,
          onChanged: (RangeValues value) {
            setState(() {
              startval1 = value.start;
              endval1 = value.end;
            });
          },
        ),
        // SizedBox(height: 15.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${startval1.toInt()} SAR",
                style: TextStyle(
                    color: ColorUtils.dividerColor,
                    fontFamily: FontUtils.almarenaRegular,
                    fontSize: 14.sp),
              ),
              Text(
                "${endval1.toInt()} SAR",
                style: TextStyle(
                    color: ColorUtils.dividerColor,
                    fontFamily: FontUtils.almarenaRegular,
                    fontSize: 14.sp),
              )
            ],
          ),
        ),
        SizedBox(height: 25.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "Minimum Price",
            style: TextStyle(
                color: ColorUtils.dividerColor,
                fontFamily: FontUtils.almarenaRegular,
                fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: EditText(
            context: context,
            hintText: "Min 50 SAR",
            // validator: validateEmail,
            // controller: emailTextController,
            textInputType: TextInputType.phone,
            textInputAction: TextInputAction.done,
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
        SizedBox(height: 20.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "Minimum Price",
            style: TextStyle(
                color: ColorUtils.dividerColor,
                fontFamily: FontUtils.almarenaRegular,
                fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: EditText(
            context: context,
            hintText: "Max 50,000 SAR",
            // validator: validateEmail,
            // controller: emailTextController,
            textInputType: TextInputType.phone,
            textInputAction: TextInputAction.done,
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
      ],
    ) : Column(
      children: [
        SizedBox(height: 10.h,),
        widget.title == "Color" ? _renderColor() : _renderSteps(),

      ],
    );
  }


  Widget _renderSteps() {
    return ListView.builder(
      itemCount: main.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return  InkWell(
          onTap: (){
            setState(() {
              if(main[index]["state"] == true){
                main[index]["state"] = false;
              }
              else{
                main[index]["state"] = true;
              }

            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 50.h,
                color: main[index]["color"],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        main[index]["title"],
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 16.sp),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: main[index]["state"] == true ? Image.asset(ImageUtils.fill_checkbox, scale: 1.7,) :
                        Image.asset(ImageUtils.empty_checkbox, scale: 1.7,),
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
  Widget _renderColor() {
    return ListView.builder(
      itemCount: color.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return  InkWell(
          onTap: (){
            setState(() {
              if(color[index]["state"] == true){
                color[index]["state"] = false;
              }
              else{
                color[index]["state"] = true;
              }

            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 50.h,
                color: color[index]["color"],
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
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: color[index]["shade"],
                          ),
                          SizedBox(width: 10.w,),
                          Text(
                            color[index]["title"],
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: color[index]["state"] == true ? Image.asset(ImageUtils.fill_checkbox, scale: 1.7,) :
                        Image.asset(ImageUtils.empty_checkbox, scale: 1.7,),
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
