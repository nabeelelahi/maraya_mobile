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

class ViewOrderScreen extends StatefulWidget {
  static const String route = "ViewOrderScreen";

  @override
  _ViewOrderScreenState createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {

  List<Map<String,dynamic>> categories = [];


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    categories =[
      {
        "title": "Edit Profile",
        "color": ColorUtils.white,
        "image": ImageUtils.profilep,
      },
      {
        "title": "Wish List",
        "color": ColorUtils.listColor,
        "image": ImageUtils.wishlistp,
      },

      {
        "title": "Order History",
        "color": ColorUtils.white,
        "image": ImageUtils.orderp,
      },
      {
        "title": "Change Delivery Address",
        "color": ColorUtils.listColor,
        "image": ImageUtils.deliveryp,
      },

      {
        "title": "Payment Method",
        "color": ColorUtils.white,
        "image": ImageUtils.paymentp,
      },
      {
        "title": "Account Settings",
        "color": ColorUtils.listColor,
        "image": ImageUtils.accountp,
      },
      {
        "title": "Contact Us",
        "color": ColorUtils.white,
        "image": ImageUtils.contactp,
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: ViewOrderScreen');
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Status: In Delivery",
              style: TextStyle(
                  color: ColorUtils.black,
                  fontFamily: FontUtils.almarenaRegular,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp),
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        // Container(
        //   color: ColorUtils.listColor,
        //   width: double.infinity,
        //   padding: EdgeInsets.zero,
        //   height: 120.h,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       InkWell(
        //           onTap: () async {
        //             await showDialog(
        //                 context: context,
        //                 barrierDismissible: true,
        //                 builder: (_) => ImageDialog(Images)
        //             );
        //           },
        //           child: Image.asset(ImageUtils.cloth1,)),
        //       SizedBox(width: 10.w,),
        //       Padding(
        //         padding: EdgeInsets.symmetric(vertical: 12.h),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 SizedBox(
        //                   width: 150.w,
        //                   height: 23.h,
        //                   child: Text(
        //                     "Asymmetric Draped Maxi Dress in Sequins",
        //                     style: TextStyle(
        //                         color: ColorUtils.dividerColor,
        //                         fontWeight: FontWeight.w400,
        //                         fontFamily: FontUtils.almarenaRegular,
        //                         fontSize: 14.sp),),
        //                 ),
        //                 SizedBox(width: 10.w,),
        //                 SizedBox(
        //                   width: 70.w,
        //                   child: Text(
        //                     "1,000 SAR",
        //                     style: TextStyle(
        //                         color: ColorUtils.dividerColor,
        //                         fontWeight: FontWeight.w400,
        //                         fontFamily: FontUtils.almarenaBold,
        //                         fontSize: 14.sp),),
        //                 )
        //               ],
        //             ),
        //             SizedBox(height: 15.h,),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Container(
        //                   // color: ColorUtils.dodgerBlue,
        //                   width: 115.w,
        //                   child: Text(
        //                     "Color: Red",
        //                     style: TextStyle(
        //                         color: ColorUtils.dividerColor,
        //                         fontWeight: FontWeight.w400,
        //                         fontFamily: FontUtils.almarenaRegular,
        //                         fontSize: 12.sp),),
        //                 ),
        //                 SizedBox(width: 5.w,),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: [
        //                     Text(
        //                       "Quantity :  ",
        //                       style: TextStyle(
        //                           color: ColorUtils.dividerColor,
        //                           fontFamily: FontUtils.almarenaRegular,
        //                           fontSize: 12.sp),
        //                     ),
        //                     Image.asset(ImageUtils.minus, scale: 4, color: ColorUtils.black,),
        //                     SizedBox(width: 10.w,),
        //                     Text(
        //                       "1",
        //                       style: TextStyle(
        //                           color: ColorUtils.dividerColor,
        //                           fontFamily: FontUtils.almarenaRegular,
        //                           fontSize: 14.sp),
        //                     ),
        //                     SizedBox(width: 10.w,),
        //                     Image.asset(ImageUtils.plus, scale: 4, color: ColorUtils.black,)
        //                   ],
        //                 )
        //               ],
        //             ),
        //             // SizedBox(height: 5.h,),
        //             Container(
        //               // color: ColorUtils.dodgerBlue,
        //               width: 115.w,
        //               child: Text(
        //                 "Size: M",
        //                 style: TextStyle(
        //                     color: ColorUtils.dividerColor,
        //                     fontWeight: FontWeight.w400,
        //                     fontFamily: FontUtils.almarenaRegular,
        //                     fontSize: 12.sp),),
        //             ),
        //             SizedBox(height: 10.h,),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Text(
        //                   "Add to wishlist",
        //                   style: TextStyle(
        //                       color: ColorUtils.dividerColor,
        //                       fontWeight: FontWeight.w400,
        //                       decoration: TextDecoration.underline,
        //                       fontFamily: FontUtils.almarenaRegular,
        //                       fontSize: 10.sp),),
        //                 SizedBox(width: 22.w,),
        //                 Text(
        //                   "Remove from list",
        //                   style: TextStyle(
        //                       color: ColorUtils.dividerColor,
        //                       fontWeight: FontWeight.w400,
        //                       decoration: TextDecoration.underline,
        //                       fontFamily: FontUtils.almarenaRegular,
        //                       fontSize: 10.sp),),
        //                 SizedBox(width: 55.w,),
        //                 InkWell(
        //                     onTap: (){
        //                       showModalBottomSheet(
        //                           context: context,
        //                           isDismissible: true,
        //                           useRootNavigator: true,
        //                           builder: (context) {
        //                             return StatefulBuilder(
        //                               builder: (BuildContext context, StateSetter setState){
        //                                 return Container(
        //                                   height: 260.h,
        //                                   child: Padding(
        //                                     padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        //                                     child: Column(
        //                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                       crossAxisAlignment: CrossAxisAlignment.start,
        //                                       children: [
        //                                         Row(
        //                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                           crossAxisAlignment: CrossAxisAlignment.center,
        //                                           children: [
        //                                             Text(
        //                                               "Change color or size",
        //                                               style: TextStyle(
        //                                                   color: ColorUtils.dividerColor,
        //                                                   fontFamily: FontUtils.almarenaRegular,
        //                                                   fontWeight: FontWeight.w400,
        //                                                   fontSize: 20.sp),
        //                                             ),
        //                                             InkWell(
        //                                                 onTap: (){
        //                                                   Navigator.pop(context);
        //                                                 },
        //                                                 child: Image.asset(ImageUtils.cross, scale: 2,))
        //                                           ],
        //                                         ),
        //                                         SizedBox(height: 20.h,),
        //                                         Row(
        //                                           mainAxisAlignment: MainAxisAlignment.start,
        //                                           crossAxisAlignment: CrossAxisAlignment.start,
        //                                           children: [
        //                                             Padding(
        //                                               padding: EdgeInsets.only(top: 3.h),
        //                                               child: Text(
        //                                                 "Color : ",
        //                                                 style: TextStyle(
        //                                                     color: ColorUtils.black,
        //                                                     fontFamily: FontUtils.almarenaRegular,
        //                                                     fontSize: 16.sp),
        //                                               ),
        //                                             ),
        //                                             SizedBox(width: 10.w,),
        //                                             Row(
        //                                               mainAxisAlignment: MainAxisAlignment.start,
        //                                               crossAxisAlignment: CrossAxisAlignment.start,
        //                                               children: [
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       colors[0]["state"] = true;
        //                                                       colors[1]["state"] = false;
        //                                                       colors[2]["state"] = false;
        //                                                       colors[3]["state"] = false;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 20.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         CircleAvatar(
        //                                                           radius: 12,
        //                                                           backgroundColor: colors[0]["color"],
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: colors[0]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.black,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                                 SizedBox(width: 15.w,),
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       colors[0]["state"] = false;
        //                                                       colors[1]["state"] = true;
        //                                                       colors[2]["state"] = false;
        //                                                       colors[3]["state"] = false;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 20.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         CircleAvatar(
        //                                                           radius: 12,
        //                                                           backgroundColor: colors[1]["color"],
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: colors[1]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.black,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                                 SizedBox(width: 15.w,),
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       colors[0]["state"] = false;
        //                                                       colors[1]["state"] = false;
        //                                                       colors[2]["state"] = true;
        //                                                       colors[3]["state"] = false;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 20.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         CircleAvatar(
        //                                                           radius: 12,
        //                                                           backgroundColor: colors[2]["color"],
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: colors[2]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.black,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                                 SizedBox(width: 15.w,),
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       colors[0]["state"] = false;
        //                                                       colors[1]["state"] = false;
        //                                                       colors[2]["state"] = false;
        //                                                       colors[3]["state"] = true;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 20.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         CircleAvatar(
        //                                                           radius: 12,
        //                                                           backgroundColor: colors[3]["color"],
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: colors[3]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.black,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 )
        //                                               ],
        //                                             )
        //                                           ],
        //                                         ),
        //                                         SizedBox(height: 10.h,),
        //                                         Row(
        //                                           mainAxisAlignment: MainAxisAlignment.start,
        //                                           crossAxisAlignment: CrossAxisAlignment.start,
        //                                           children: [
        //                                             Padding(
        //                                               padding: EdgeInsets.only(top: 3.h),
        //                                               child: Text(
        //                                                 "Size : ",
        //                                                 style: TextStyle(
        //                                                     color: ColorUtils.black,
        //                                                     fontFamily: FontUtils.almarenaRegular,
        //                                                     fontSize: 16.sp),
        //                                               ),
        //                                             ),
        //                                             SizedBox(width: 10.w,),
        //                                             Row(
        //                                               mainAxisAlignment: MainAxisAlignment.start,
        //                                               crossAxisAlignment: CrossAxisAlignment.start,
        //                                               children: [
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       sizes[0]["state"] = true;
        //                                                       sizes[1]["state"] = false;
        //                                                       sizes[2]["state"] = false;
        //                                                       sizes[3]["state"] = false;
        //                                                       sizes[4]["state"] = false;
        //                                                       sizes[5]["state"] = false;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 28.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         Text(
        //                                                           sizes[0]["size"],
        //                                                           style: TextStyle(
        //                                                               color: ColorUtils.black,
        //                                                               fontFamily: FontUtils.almarenaRegular,
        //                                                               fontSize: 14.sp),
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: sizes[0]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.black,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                                 SizedBox(width: 13.w,),
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       sizes[0]["state"] = false;
        //                                                       sizes[1]["state"] = true;
        //                                                       sizes[2]["state"] = false;
        //                                                       sizes[3]["state"] = false;
        //                                                       sizes[4]["state"] = false;
        //                                                       sizes[5]["state"] = false;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 13.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         Text(
        //                                                           sizes[1]["size"],
        //                                                           style: TextStyle(
        //                                                               color: ColorUtils.black,
        //                                                               fontFamily: FontUtils.almarenaRegular,
        //                                                               fontSize: 14.sp),
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: sizes[1]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.black,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                                 SizedBox(width: 13.w,),
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       sizes[0]["state"] = false;
        //                                                       sizes[1]["state"] = false;
        //                                                       sizes[2]["state"] = true;
        //                                                       sizes[3]["state"] = false;
        //                                                       sizes[4]["state"] = false;
        //                                                       sizes[5]["state"] = false;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 13.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         Text(
        //                                                           sizes[2]["size"],
        //                                                           style: TextStyle(
        //                                                               color: ColorUtils.hintColor,
        //                                                               fontFamily: FontUtils.almarenaRegular,
        //                                                               fontSize: 14.sp),
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: sizes[2]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.hintColor,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                                 SizedBox(width: 13.w,),
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       sizes[0]["state"] = false;
        //                                                       sizes[1]["state"] = false;
        //                                                       sizes[2]["state"] = false;
        //                                                       sizes[3]["state"] = true;
        //                                                       sizes[4]["state"] = false;
        //                                                       sizes[5]["state"] = false;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 13.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         Text(
        //                                                           sizes[3]["size"],
        //                                                           style: TextStyle(
        //                                                               color: ColorUtils.black,
        //                                                               fontFamily: FontUtils.almarenaRegular,
        //                                                               fontSize: 14.sp),
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: sizes[3]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.black,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                                 SizedBox(width: 13.w,),
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       sizes[0]["state"] = false;
        //                                                       sizes[1]["state"] = false;
        //                                                       sizes[2]["state"] = false;
        //                                                       sizes[3]["state"] = false;
        //                                                       sizes[4]["state"] = true;
        //                                                       sizes[5]["state"] = false;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 20.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         Text(
        //                                                           sizes[4]["size"],
        //                                                           style: TextStyle(
        //                                                               color: ColorUtils.black,
        //                                                               fontFamily: FontUtils.almarenaRegular,
        //                                                               fontSize: 14.sp),
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: sizes[4]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.black,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                                 SizedBox(width: 13.w,),
        //                                                 InkWell(
        //                                                   onTap:(){
        //                                                     setState(() {
        //                                                       sizes[0]["state"] = false;
        //                                                       sizes[1]["state"] = false;
        //                                                       sizes[2]["state"] = false;
        //                                                       sizes[3]["state"] = false;
        //                                                       sizes[4]["state"] = false;
        //                                                       sizes[5]["state"] = true;
        //                                                     });
        //                                                   },
        //                                                   child: SizedBox(
        //                                                     width: 28.w,
        //                                                     child: Column(
        //                                                       mainAxisAlignment: MainAxisAlignment.start,
        //                                                       crossAxisAlignment: CrossAxisAlignment.center,
        //                                                       children: [
        //                                                         Text(
        //                                                           sizes[5]["size"],
        //                                                           style: TextStyle(
        //                                                               color: ColorUtils.hintColor,
        //                                                               fontFamily: FontUtils.almarenaRegular,
        //                                                               fontSize: 14.sp),
        //                                                         ),
        //                                                         Visibility(
        //                                                           visible: sizes[5]["state"],
        //                                                           child: Divider(
        //                                                             height: 10,
        //                                                             color: ColorUtils.hintColor,
        //                                                             thickness: 2,
        //                                                           ),
        //                                                         ),
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                               ],
        //                                             )
        //
        //                                           ],
        //                                         ),
        //                                         SizedBox(height: 15.h,),
        //                                         SizedBox(
        //                                           width: double.infinity,
        //                                           child: Row(
        //                                             mainAxisAlignment: MainAxisAlignment.start,
        //                                             crossAxisAlignment: CrossAxisAlignment.center,
        //                                             children: [
        //                                               Text(
        //                                                 'This model is 6ft tall and is wearing size L.',
        //                                                 style: TextStyle(
        //                                                     color: ColorUtils.black,
        //                                                     fontFamily: FontUtils.almarenaRegular,
        //                                                     fontSize: 13.sp),),
        //                                               SizedBox(width: 1.w,),
        //                                               InkWell(
        //                                                 onTap: (){
        //                                                   showDialog(
        //                                                       context: context,
        //                                                       builder: (BuildContext context) {
        //                                                         return Dialog(
        //                                                           shape: RoundedRectangleBorder(
        //                                                               borderRadius:
        //                                                               BorderRadius.circular(0.0)), //this right here
        //                                                           child: Container(
        //                                                             height: 300.h,
        //                                                             child: Padding(
        //                                                               padding: const EdgeInsets.all(12.0),
        //                                                               child: Column(
        //                                                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                                                 crossAxisAlignment: CrossAxisAlignment.start,
        //                                                                 children: [
        //                                                                   Align(
        //                                                                       alignment: Alignment.centerRight,
        //                                                                       child: InkWell(
        //                                                                           onTap: (){
        //                                                                             Navigator.pop(context);
        //                                                                           },
        //                                                                           child: Image.asset(ImageUtils.cross, scale: 2,))),
        //                                                                   SizedBox(height: 15.h,),
        //                                                                   Table(
        //                                                                     border: TableBorder.all(color: Colors.black),
        //                                                                     children: [
        //                                                                       TableRow(
        //                                                                           children: [
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "SIZE",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "BUST",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "WAIST",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "HIP",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                           ]),
        //                                                                       TableRow(
        //                                                                           children: [
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "XS",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "32",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "26",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "35",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                           ]),
        //                                                                       TableRow(
        //                                                                           children: [
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "S",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "34",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "28",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "38",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                           ]),
        //                                                                       TableRow(
        //                                                                           children: [
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "M",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "38",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "30",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "40",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                           ]),
        //                                                                       TableRow(
        //                                                                           children: [
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "L",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "38",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "32",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "42",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                           ]),
        //                                                                       TableRow(
        //                                                                           children: [
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "XL",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "40",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "34",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "44",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                           ]),
        //                                                                       TableRow(
        //                                                                           children: [
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "XXL",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "42",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "36",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                             Padding(
        //                                                                               padding: EdgeInsets.symmetric(vertical: 8.h),
        //                                                                               child: Text(
        //                                                                                 "46",
        //                                                                                 textAlign: TextAlign.center,
        //                                                                                 style: TextStyle(
        //                                                                                     color: ColorUtils.dividerColor,
        //                                                                                     fontFamily: FontUtils.almarenaDisplayBold,
        //                                                                                     fontSize: 16.sp),
        //                                                                               ),
        //                                                                             ),
        //                                                                           ]),
        //                                                                     ],
        //                                                                   ),
        //                                                                 ],
        //                                                               ),
        //                                                             ),
        //                                                           ),
        //                                                         );
        //                                                       });
        //                                                 },
        //                                                 child: Text(
        //                                                   'View Size Chart',
        //                                                   style: TextStyle(
        //                                                       color: ColorUtils.black,
        //                                                       decoration: TextDecoration.underline,
        //                                                       fontFamily: FontUtils.almarenaRegular,
        //                                                       fontSize: 14.sp),
        //                                                 ),
        //                                               )
        //                                             ],
        //                                           ),
        //                                         ),
        //                                         SizedBox(height: 20.h,),
        //                                         MyButton(
        //                                           text: "Select",
        //                                           textColor: ColorUtils.white,
        //                                           circularRadius: 0,
        //                                           onPress: () {
        //                                             Navigator.pop(context);
        //                                           },
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                 );
        //                               },
        //                             );
        //                           });
        //                     },
        //                     child: Image.asset(ImageUtils.pencil, scale: 1.6,))
        //               ],
        //             )
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // _renderSteps(),

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
        return  Container(
          color: categories[index]['color'],
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Order # 1234",
                    style: TextStyle(
                        color: ColorUtils.dividerColor,
                        fontFamily: FontUtils.almarenaRegular,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp),
                  ),
                  Text(
                    "Status: In Delivery",
                    style: TextStyle(
                        color: ColorUtils.dividerColor,
                        fontFamily: FontUtils.almarenaRegular,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Text(
                "Order Placed on 9 May",
                style: TextStyle(
                    color: ColorUtils.hintColor,
                    fontFamily: FontUtils.almarenaRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
              ),
              SizedBox(height: 10.h,),
              Text(
                "Price: 2,000 SAR",
                style: TextStyle(
                    color: ColorUtils.hintColor,
                    fontFamily: FontUtils.almarenaRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
              ),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Long-sleeve Max...",
                    style: TextStyle(
                        color: ColorUtils.hintColor,
                        fontFamily: FontUtils.almarenaRegular,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "View Order",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorUtils.dotGreen,
                            fontSize: 12.sp),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: ColorUtils.dividerColor,
                        size: 16.0,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 15.h,),

            ],
          ),
        );
      },
    );

  }





  FocusNode city = FocusNode(), area = FocusNode(), address = FocusNode(), name = FocusNode(),
      apartment = FocusNode();
  String? City, Area, Address, Apartment;

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode(), FocusNode(),];

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _focusNodes[0]),
        KeyboardActionsItem(focusNode: _focusNodes[1]),
        KeyboardActionsItem(focusNode: _focusNodes[2]),
      ],
    );
  }

  TextEditingController
      cityTextController = TextEditingController(),
      areaTextController = TextEditingController(),
      nameTextController = TextEditingController(),
      addressTextController = TextEditingController(),
      apartmentTextController = TextEditingController();

  final GlobalKey<FormState> _formKey =
  GlobalKey<FormState>(debugLabel: '_AddAddressScreen');
  List<String> cities = ["Riyadh", "Jeddah"];
  List<String> areas = ["Riyadh", "Jeddah"];
  bool autoValidate = false, obscure = true;
  void EditAddress(){
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        useRootNavigator: true,
        isScrollControlled: false,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setstate){
              return KeyboardActions(
                config: _buildConfig(context),
                child: Container(
                    // height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(color: ColorUtils.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Edit Address",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: FontUtils.almarenaBold,
                                    fontSize: 16.sp),),
                              Text(
                                "Delete",
                                style: TextStyle(
                                    color: ColorUtils.dividerColor,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorUtils.dotGreen,
                                    fontFamily: FontUtils.almarenaBold,
                                    fontSize: 14.sp),),
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          autovalidateMode: autoValidate
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Text("City*",
                                    style: TextStyle(
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 16.sp,
                                        color: ColorUtils.dividerColor)),
                              ),
                              Spinner(
                                onChange: (value){
                                  if(mounted)
                                    setState(() {
                                      City = value;

                                    });
                                },
                                dropdownValue: City,
                                heading: "City*",
                                hint: "Select City",
                                array: cities,
                                borderColor: ColorUtils.main_background,
                                filledColor: ColorUtils.white,
                              ),
                              SizedBox(height: 20.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Text("Area*",
                                    style: TextStyle(
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 16.sp,
                                        color: ColorUtils.dividerColor)),
                              ),
                              Spinner(
                                onChange: (value){
                                  if(mounted)
                                    setState(() {
                                      Area = value;

                                    });
                                },
                                dropdownValue: Area,
                                heading: "Area*",
                                hint: "Select Area",
                                array: areas,
                                borderColor: ColorUtils.main_background,
                                filledColor: ColorUtils.white,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20.h,),
                                    Text("Delivery Address*",
                                        style: TextStyle(
                                            fontFamily: FontUtils.almarenaRegular,
                                            fontSize: 16.sp,
                                            color: ColorUtils.dividerColor)),
                                    SizedBox(height: 5.h,),
                                    EditText(
                                      context: context,
                                      hintText: "eg. 11 Kaiyuan Road",
                                      controller: addressTextController,
                                      currentFocus: _focusNodes[0],
                                      nextFocus: _focusNodes[1],
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      bordercolor: ColorUtils.white,
                                      onSaved: (text) {},
                                      onChange: (text) {},
                                    ),
                                    SizedBox(height: 20.h,),
                                    Text("Apartment / Hotel Room / Villa*",
                                        style: TextStyle(
                                            fontFamily: FontUtils.almarenaRegular,
                                            fontSize: 16.sp,
                                            color: ColorUtils.dividerColor)),
                                    SizedBox(height: 5.h,),
                                    EditText(
                                      context: context,
                                      hintText: "eg. Apartment 2102",
                                      controller: apartmentTextController,
                                      currentFocus: _focusNodes[1],
                                      nextFocus: _focusNodes[2],
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      bordercolor: ColorUtils.white,
                                      onSaved: (text) {},
                                      onChange: (text) {},
                                    ),
                                    SizedBox(height: 20.h,),
                                    Text("Title",
                                        style: TextStyle(
                                            fontFamily: FontUtils.almarenaRegular,
                                            fontSize: 16.sp,
                                            color: ColorUtils.dividerColor)),
                                    SizedBox(height: 5.h,),
                                    EditText(
                                      context: context,
                                      hintText: "Home1",
                                      controller: nameTextController,
                                      currentFocus: _focusNodes[2],
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      bordercolor: ColorUtils.white,
                                      onSaved: (text) {},
                                      onChange: (text) {},
                                    ),
                                    SizedBox(height: 30.h,),
                                    MyButton(
                                      text: "Save",
                                      textColor: ColorUtils.white,
                                      circularRadius: 0,
                                      onPress: () {
                                        Navigator.pop(context, "review");
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20.h,),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
          );
        });
  }
  void DeleteAccount(){
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        useRootNavigator: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setstate){
              return Container(
                height: 240.h,
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
                            "Are you sure you want to delete your account?",
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontFamily: FontUtils.almarenaRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset(ImageUtils.cross, scale: 2.5,),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Text(
                        "Your order history and all saved information will be lost, and you would have to create an account again to place your order",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp),
                      ),
                      SizedBox(height: 20.h,),
                      EditText(
                        context: context,
                        hintText: "Type Yes if you want to delete your account",
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
                      SizedBox(height: 30.h,),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Delete Account",
                                  style: TextStyle(
                                      color: ColorUtils.black,
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
          );
        });
  }
  void DeleteCard(){
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      useRootNavigator: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setstate){
            return Container(
              height: 200.h,
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
                          "Delete Card?",
                          style: TextStyle(
                              color: ColorUtils.black,
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
                    SizedBox(height: 30.h,),
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
                              fontSize: 16.sp),),
                        SizedBox(width: 10.w,),
                        Image.asset(ImageUtils.master, scale: 3,)
                      ],
                    ),
                    SizedBox(height: 50.h,),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Confirm",
                                style: TextStyle(
                                    color: ColorUtils.white,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 20.sp),
                              ),
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
  }
  void AddNewCard(){
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      useRootNavigator: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setstate){
            return Container(
              height: 300.h,
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
                          "Add a New Card",
                          style: TextStyle(
                              color: ColorUtils.black,
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
                    SizedBox(height: 30.h,),
                    EditText(
                      context: context,
                      hintText: "Name on Card*",
                      controller: nameTextController,
                      currentFocus: _focusNodes[0],
                      nextFocus: _focusNodes[1],
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      bordercolor: ColorUtils.white,
                      onSaved: (text) {},
                      onChange: (text) {},
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 220.w,
                          child: EditText(
                            context: context,
                            hintText: "Card Number*",
                            // controller: numberNameController,
                            // currentFocus: _focusNodes[1],
                            // nextFocus: _focusNodes[2],
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            bordercolor: ColorUtils.white,
                            onSaved: (text) {},
                            onChange: (text) {},
                          ),
                        ),
                        // SizedBox(height: 15.h,),
                        SizedBox(
                          width: 90.w,
                          child: EditText(
                            context: context,
                            hintText: "CVV*",
                            // controller: cvvNameController,
                            // currentFocus: _focusNodes[2],
                            // nextFocus: _focusNodes[3],
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            bordercolor: ColorUtils.white,
                            onSaved: (text) {},
                            onChange: (text) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    EditText(
                      context: context,
                      hintText: "Expiration Date*",
                      // controller: expireTextController,
                      // currentFocus: _focusNodes[3],
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      bordercolor: ColorUtils.white,
                      onSaved: (text) {},
                      onChange: (text) {},
                    ),
                    SizedBox(height: 50.h,),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Save",
                                style: TextStyle(
                                    color: ColorUtils.white,
                                    fontFamily: FontUtils.almarenaRegular,
                                    fontSize: 20.sp),
                              ),
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
  }



}
