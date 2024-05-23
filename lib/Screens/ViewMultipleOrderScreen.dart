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

class ViewMultipleOrderScreen extends StatefulWidget {
  static const String route = "ViewMultipleOrderScreen";

  @override
  _ViewMultipleOrderScreenState createState() => _ViewMultipleOrderScreenState();
}

class _ViewMultipleOrderScreenState extends State<ViewMultipleOrderScreen> {

  List<Map<String,dynamic>> categories = [];
  List<String> Images = [ImageUtils.cloth1, ImageUtils.cloth7, ImageUtils.cloth10];
  bool returnItems = false;
  bool damaged = false;
  bool size = false;
  bool different = false;
  bool other = false;
  bool store = false;
  bool courier = false;


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    categories =[
      {
        "title": "Long-sleeve Maxi Dress in Viscose-blend Jersey",
        "color": ColorUtils.listColor,
        "image": ImageUtils.cloth1,
        "price": "2,000 SAR",
        "selected": false,
      },
      {
        "title": "Cinch M Shoulder Bag in Calf Leather",
        "color": ColorUtils.listColor,
        "image": ImageUtils.cloth2,
        "price": "3,000 SAR",
        "selected": false,
      },
      {
        "title": "Tank Top in Silk-satin",
        "color": ColorUtils.listColor,
        "image": ImageUtils.cloth3,
        "price": "3,500 SAR",
        "selected": false,
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: ViewMultipleOrderScreen');
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
      bottomNavigationBar: returnItems == true ? Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: InkWell(
          onTap: (){
            ReturnProduct();
          },
          child: Container(
            width: double.infinity,
            height: 42.h,
            decoration: BoxDecoration(
              color: ColorUtils.black,
              border: Border.all(
                width: 1.5,
                color: Colors.black,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Return 2 Items",
                    style: TextStyle(
                        color: ColorUtils.white,
                        fontFamily: FontUtils.almarenaDisplayRegular,
                        fontSize: 20.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
      ) : SizedBox(),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  if(returnItems == true){
                    returnItems = false;
                  }
                  else{
                    returnItems = true;
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(returnItems == false ? ImageUtils.empty_checkbox : ImageUtils.checkbox, scale: 3,),
                  SizedBox(width: 5.w,),
                  Text(
                    "Return Items",
                    style: TextStyle(
                        color: ColorUtils.dividerColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 16.sp),),
                ],
              ),
            ),
            Text(
              "Status: Delivered",
              style: TextStyle(
                  color: ColorUtils.black,
                  fontFamily: FontUtils.almarenaRegular,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp),
            ),
          ],
        ),
        SizedBox(height: 20.h,),
        _renderSteps(),
        SizedBox(height: 20.h,),
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


  Widget _renderSteps() {
    return ListView.separated(
      itemCount: categories.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.w,),
      itemBuilder: (BuildContext context, int index) {
        return  InkWell(
          onTap: (){
            setState(() {
              if(returnItems){
                if(categories[index]['selected'] == true){
                  categories[index]['selected'] = false;
                }
                else{
                  categories[index]['selected'] = true;
                }
              }
            });
          },
          child: Container(
            color: categories[index]['color'],
            width: double.infinity,
            padding: EdgeInsets.zero,
            height: 100.h,
            child: Stack(
              children: [
                Row(
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
                        child: Image.asset(categories[index]['image'],)),
                    SizedBox(width: 10.w,),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
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
                                  categories[index]['title'],
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
                                  categories[index]['price'],
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
                Visibility(
                  visible: returnItems,
                  child: Positioned(
                    left: 10.w,
                      top: 5.h,
                      child: Image.asset(categories[index]['selected'] == false ? ImageUtils.empty_checkbox : ImageUtils.checkbox, scale: 3,)),
                ),
              ],
            ),
          ),
        );
      },
    );

  }


  void ReturnProduct(){
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        // isScrollControlled: true,
        // useRootNavigator: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setstate){
                return Container(
                  // height: 500.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Reason for return",
                              style: TextStyle(
                                  color: ColorUtils.dividerColor,
                                  fontFamily: FontUtils.almarenaRegular,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Image.asset(ImageUtils.cross, scale: 2.5,),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h,),
                        Text(
                          "Item 1 of 2",
                          style: TextStyle(
                              color: ColorUtils.dividerColor,
                              fontFamily: FontUtils.almarenaRegular,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        ),
                        SizedBox(height: 20.h,),
                        Container(
                          color: categories[0]['color'],
                          width: double.infinity,
                          padding: EdgeInsets.zero,
                          height: 100.h,
                          child: Stack(
                            children: [
                              Row(
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
                                      child: Image.asset(categories[0]['image'],)),
                                  SizedBox(width: 10.w,),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
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
                                                categories[0]['title'],
                                                style: TextStyle(
                                                    color: ColorUtils.dividerColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: FontUtils.almarenaRegular,
                                                    fontSize: 14.sp),),
                                            ),
                                            SizedBox(width: 10.w,),
                                            SizedBox(
                                              width: 80.w,
                                              child: Text(
                                                categories[0]['price'],
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
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        InkWell(
                          onTap: (){
                            setstate(() {
                              damaged = true;
                              size = false;
                              different = false;
                              other = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Item is damaged",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 14.sp),),
                              Image.asset(damaged == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        InkWell(
                          onTap: (){
                            setstate(() {
                              damaged = false;
                              size = true;
                              different = false;
                              other = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Wrong size",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 14.sp),),
                              Image.asset(size == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        InkWell(
                          onTap: (){
                            setstate(() {
                              damaged = false;
                              size = false;
                              different = true;
                              other = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Looks different in person",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 14.sp),),
                              Image.asset(different == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        InkWell(
                          onTap: (){
                            setstate(() {
                              damaged = false;
                              size = false;
                              different = false;
                              other = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Other",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 14.sp),),
                              Image.asset(other == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        EditText(
                          context: context,
                          hintText: "Describe why",
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          bordercolor: ColorUtils.white,
                          // labelText: StringUtils.EMAIL,
                          onSaved: (text) {
                            // Email = text;
                          },
                          onChange: (text) {
                            // Email = text;
                          },
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: InkWell(
                            onTap: (){
                              ReasonReturnProduct();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: ColorUtils.black,
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Continue",
                                      style: TextStyle(
                                          color: ColorUtils.white,
                                          fontFamily: FontUtils.almarenaDisplayRegular,
                                          fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
  void ReasonReturnProduct(){
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        // isScrollControlled: true,
        // useRootNavigator: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setstate){
                return Container(
                  height: 180.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Reason for return",
                                  style: TextStyle(
                                      color: ColorUtils.dividerColor,
                                      fontFamily: FontUtils.almarenaRegular,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp),
                                ),

                              ],
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Image.asset(ImageUtils.cross, scale: 2.5,),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h,),
                        InkWell(
                          onTap: (){
                            setstate(() {
                              store = true;
                              courier = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Return in Store",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 14.sp),),
                              Image.asset(store == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        InkWell(
                          onTap: (){
                            setstate(() {
                              store = false;
                              courier = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Return by Courier",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 14.sp),),
                              Image.asset(courier == true ? ImageUtils.checkbox : ImageUtils.empty_checkbox, scale: 3,)
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h,),
                        InkWell(
                          onTap: (){
                            ReturnedProduct();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: ColorUtils.black,
                              border: Border.all(
                                width: 1.5,
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Confirm",
                                    style: TextStyle(
                                        color: ColorUtils.white,
                                        fontFamily: FontUtils.almarenaDisplayRegular,
                                        fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
  void ReturnedProduct(){
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        // isScrollControlled: true,
        // useRootNavigator: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setstate){
                return Container(
                  height: 140.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                "You can return the item at our flagship outlet located at Shop#1, 123 road, xyz area, Riyadh",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Image.asset(ImageUtils.cross, scale: 2.5,),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h,),
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: ColorUtils.black,
                              border: Border.all(
                                width: 1.5,
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "View in Map",
                                    style: TextStyle(
                                        color: ColorUtils.white,
                                        fontFamily: FontUtils.almarenaDisplayRegular,
                                        fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }



}
