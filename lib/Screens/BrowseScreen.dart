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

class BrowseScreen extends StatefulWidget {
  static const String route = "BrowseScreen";
  bool? show;
  BrowseScreen({Key? key,this.show}) : super(key: key);

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {

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
    print('State: BrowseScreen');
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
            child: Text(translate('strings.BrowseClothing'))) ,
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
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150.w,
                // height: 60.h,
                child: EditText(
                  context: context,
                  hintText: "Search",
                  validator: validateEventName,
                  // controller: DateofBirthController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  // prefixIcon: ImageUtils.calendar,
                  suffixIcon: ImageUtils.search,
                  bordercolor: ColorUtils.white,
                  onSaved: (text) {
                    // DateOfBirth = text;
                  },
                  onChange: (text) {
                    // DateOfBirth = text;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          isDismissible: true,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState){
                                return Container(
                                  height: 250.h,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 300.w,
                                              child: Text(
                                                "Sort by",
                                                style: TextStyle(
                                                    color: ColorUtils.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: FontUtils.almarenaRegular,
                                                    fontSize: 18.sp),),
                                            ),
                                            InkWell(
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(ImageUtils.cross, scale: 1.6,))
                                          ],
                                        ),
                                      ),
                                      // SizedBox(height: 10.h,),
                                      ListView.builder(
                                        itemCount: sort.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index) {
                                          return  InkWell(
                                            onTap: (){
                                              setState(() {
                                                if(sort[index]["title"] == ""){}
                                                else{
                                                  if(sort[index]["state"] == true){
                                                    sort[index]["state"] = false;
                                                  }
                                                  else{
                                                    sort[index]["state"] = true;
                                                    for(int i = 0; i < sort.length; i++){
                                                      if(i == index){}
                                                      else{
                                                        sort[i]["state"] = false;
                                                      }
                                                    }
                                                  }
                                                }
                                              });
                                            },
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 40.h,
                                                  color: ColorUtils.white,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          sort[index]["title"],
                                                          style: TextStyle(
                                                              color: ColorUtils.dividerColor,
                                                              fontFamily: FontUtils.almarenaRegular,
                                                              fontSize: 16.sp),
                                                        ),
                                                        Align(
                                                          alignment: Alignment.centerRight,
                                                          child: sort[index]["state"] == true ? Image.asset(ImageUtils.checkbox, scale: 3,) :
                                                          Image.asset(ImageUtils.empty_checkbox, scale: 3,),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // child: Padding(
                                                  //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                                                  //   child: Row(
                                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //     crossAxisAlignment: CrossAxisAlignment.center,
                                                  //     children: [
                                                  //       Text(
                                                  //         sort[index]["title"],
                                                  //         style: TextStyle(
                                                  //             color: sort[index]["state"] == true ? ColorUtils.white :
                                                  //             ColorUtils.textcolor,
                                                  //             fontFamily: FontUtils.almarenaRegular,
                                                  //             fontSize: 16.sp),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sort",
                            style: TextStyle(
                                color: ColorUtils.black,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 16.sp),
                          ),
                          SizedBox(width: 5.w,),
                          Image.asset(ImageUtils.sort, scale: 2,)
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context, rootNavigator: false)
                            .push(MaterialPageRoute(builder: (context) =>
                            FilterScreen())).then((value){
                              if(value == true){
                                setState(() {
                                  show = true;
                                });
                              }
                              else{
                                setState(() {
                                  show = false;
                                });
                              }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Visibility(
                              visible: show,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: ColorUtils.containerColor,
                                child: Center(
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                        color: ColorUtils.dividerColor,
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 10.sp),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                                color: ColorUtils.black,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 16.sp),
                          ),
                          SizedBox(width: 5.w,),
                          Padding(
                            padding: EdgeInsets.only(top: 3.h),
                              child: Image.asset(ImageUtils.filter, scale: 2,))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h,),
        Visibility(
          visible: show,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                height: 23.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 5,),
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                          color: ColorUtils.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    filterlist.removeAt(index);
                                  });
                                },
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                      color: ColorUtils.white,
                                      fontFamily: FontUtils.almarenaRegular,
                                      fontSize: 12.sp),
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Text(
                                filterlist[index]["title"],
                                style: TextStyle(
                                    color: ColorUtils.white,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w,)
                      ],
                    );
                  },
                  itemCount: filterlist.length,
                ),
              ),
            ),
          ),
        ),
        Visibility(
            visible: show,
            child: SizedBox(height: 10.h,)),
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
}
