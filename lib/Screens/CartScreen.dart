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

  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

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
              Image.asset(ImageUtils.handbag, scale: 2.8,)
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
                Image.asset(ImageUtils.cloth1,),
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
                              Image.asset(ImageUtils.minus, scale: 2.3, color: ColorUtils.black,),
                              SizedBox(width: 10.w,),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 12.sp),
                              ),
                              SizedBox(width: 10.w,),
                              Image.asset(ImageUtils.plus, scale: 2.3, color: ColorUtils.black,)
                            ],
                          )
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
                      SizedBox(height: 15.h,),
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
                          Image.asset(ImageUtils.pencil, scale: 1.6,)
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
                              Image.asset(ImageUtils.minus, scale: 2.3, color: ColorUtils.black,),
                              SizedBox(width: 10.w,),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 12.sp),
                              ),
                              SizedBox(width: 10.w,),
                              Image.asset(ImageUtils.plus, scale: 2.3, color: ColorUtils.black,)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 5.h,),
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
                      SizedBox(height: 13.h,),
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
                          Image.asset(ImageUtils.pencil, scale: 1.6,)
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImageUtils.fill_checkbox, scale: 2,),
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
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImageUtils.empty_checkbox, scale: 2,),
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
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImageUtils.empty_checkbox, scale: 2,),
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
          SizedBox(height: 15.h,),
          Text(
            "Add Promo Code",
            style: TextStyle(
                color: ColorUtils.dividerColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontUtils.almarenaBold,
                fontSize: 16.sp),),
          SizedBox(height: 5.h,),
          EditText(
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
          SizedBox(height: 40.h,),
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
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Select Payment Method",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontUtils.almarenaBold,
                          fontSize: 16.sp),),
                    InkWell(
                      onTap: (){
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) =>
                            AddPaymentMethodScreen())).then((value){
                              if(value == "card"){
                                setState(() {
                                  cardSelected = true;
                                });
                              }
                              else{
                                setState(() {
                                  cardSelected = false;
                                });
                              }
                        });
                      },
                      child: Icon(
                        cardSelected == true ? Icons.edit : Icons.add,
                        color: ColorUtils.dividerColor,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
                Visibility(
                  visible: cardSelected,
                  child: Text(
                   "**** **** **** 1234",
                    style: TextStyle(
                        color: ColorUtils.dividerColor,
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 18.sp),
                  ),
                ),
                Visibility(
                    visible: cardSelected,
                    child: SizedBox(width: 5.w,)),
                Visibility(
                    visible: cardSelected,
                    child: Image.asset(ImageUtils.master, scale: 2.5,)),
                SizedBox(height: 50.h,),
                InkWell(
                  onTap: (){
                    Navigator.of(context, rootNavigator: false)
                        .push(MaterialPageRoute(builder: (context) =>
                        CompleteOrderScreen()));
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
}