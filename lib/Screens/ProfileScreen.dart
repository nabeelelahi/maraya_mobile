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
import 'package:maraya_flutter/Screens/OrderHistoryScreen.dart';
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

class ProfileScreen extends StatefulWidget {
  static const String route = "ProfileScreen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<Map<String,dynamic>> categories = [];
  bool english = false;
  bool arabic = true;


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
    print('State: ProfileScreen');
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 10.w,
        title: Text("My Account") ,
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
            if(categories[index]['title'] == "Edit Profile"){
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: (context) =>
                  EditProfile()));
            }
            else if(categories[index]['title'] == "Wish List"){
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: (context) =>
                  WishlistScreen()));
            }
            else if(categories[index]['title'] == "Order History"){
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: (context) =>
                  OrderHistoryScreen()));
            }
            else if(categories[index]['title'] == "Change Delivery Address"){
              showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  // useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setstate){
                          return Container(
                            height: 300.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Delivery Address",
                                    style: TextStyle(
                                        color: ColorUtils.black,
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 20.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Home1",
                                            style: TextStyle(
                                                color: ColorUtils.dividerColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp),),
                                          SizedBox(height: 5.h,),
                                          Text(
                                            "House Number 1, abc road, xyz area, Riyadh",
                                            style: TextStyle(
                                                color: ColorUtils.hintColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp),),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: (){
                                          EditAddress();
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: ColorUtils.dividerColor,
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Home2",
                                            style: TextStyle(
                                                color: ColorUtils.dividerColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp),),
                                          SizedBox(height: 5.h,),
                                          Text(
                                            "House Number 1, abc road, xyz area, Riyadh",
                                            style: TextStyle(
                                                color: ColorUtils.hintColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp),),
                                        ],
                                      ),
                                      Icon(
                                        Icons.edit,
                                        color: ColorUtils.dividerColor,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Home3",
                                            style: TextStyle(
                                                color: ColorUtils.dividerColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp),),
                                          SizedBox(height: 5.h,),
                                          Text(
                                            "House Number 1, abc road, xyz area, Riyadh",
                                            style: TextStyle(
                                                color: ColorUtils.hintColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp),),
                                        ],
                                      ),
                                      Icon(
                                        Icons.edit,
                                        color: ColorUtils.dividerColor,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h,),
                                  Divider(
                                    height: 10.h,
                                    color: ColorUtils.hintColor,
                                    thickness: 2,
                                  ),
                                  SizedBox(height: 15.h,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(builder: (context) =>
                                          AddAddressScreen()));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Add a New Address",
                                          style: TextStyle(
                                              color: ColorUtils.black,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: FontUtils.almarenaRegular,
                                              fontSize: 14.sp),),
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: ColorUtils.dividerColor,
                                          size: 16.0,
                                        ),
                                      ],
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
            else if(categories[index]['title'] == "Payment Method"){
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                // useRootNavigator: true,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: StatefulBuilder(
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
                                      "Your Cards",
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
                                Text("Previously Used",
                                    style: TextStyle(
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 10.sp,
                                        color: ColorUtils.hintColor)),
                                SizedBox(height: 15.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
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
                                    InkWell(
                                      onTap: (){
                                        DeleteCard();
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: ColorUtils.dividerColor,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.underline,
                                            decorationColor: ColorUtils.dotGreen,
                                            fontFamily: FontUtils.almarenaBold,
                                            fontSize: 13.sp),),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                Text("Others",
                                    style: TextStyle(
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 10.sp,
                                        color: ColorUtils.hintColor)),
                                SizedBox(height: 15.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "********5678",
                                          style: TextStyle(
                                              color: ColorUtils.dividerColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontUtils.almarenaRegular,
                                              fontSize: 16.sp),),
                                        SizedBox(width: 10.w,),
                                        Image.asset(ImageUtils.visa, scale: 3,)
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        DeleteCard();
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: ColorUtils.dividerColor,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.underline,
                                            decorationColor: ColorUtils.dotGreen,
                                            fontFamily: FontUtils.almarenaBold,
                                            fontSize: 13.sp),),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "********5678",
                                          style: TextStyle(
                                              color: ColorUtils.dividerColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontUtils.almarenaRegular,
                                              fontSize: 16.sp),),
                                        SizedBox(width: 10.w,),
                                        Image.asset(ImageUtils.mada, scale: 3,)
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        DeleteCard();
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: ColorUtils.dividerColor,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.underline,
                                            decorationColor: ColorUtils.dotGreen,
                                            fontFamily: FontUtils.almarenaBold,
                                            fontSize: 13.sp),),
                                    )
                                  ],
                                ),
                                SizedBox(height: 50.h,),
                                InkWell(
                                  onTap: (){
                                    AddNewCard();
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
                                            "Add New Card",
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
                    ),
                  );
                },
              );
            }
            else if(categories[index]['title'] == "Account Settings"){
              showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  // useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setstate){
                          return Container(
                            height: 600.h,
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
                                        "Settings",
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
                                  SizedBox(height: 20.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(ImageUtils.language, scale: 3,),
                                          SizedBox(width: 10.w,),
                                          Text(
                                            "Language",
                                            style: TextStyle(
                                                color: ColorUtils.dividerColor,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              setstate(() {
                                                if(english){
                                                  arabic = false;
                                                }
                                                else{
                                                  english = true;
                                                  arabic = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 30.h,
                                              color: english == true ? ColorUtils.black : ColorUtils.containerColor,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                                child: Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Text(
                                                    "English",
                                                    style: TextStyle(
                                                        fontFamily: FontUtils.almarenaRegular,
                                                        color: english == true ? ColorUtils.white : ColorUtils.dividerColor,
                                                        fontSize: 16.sp,
                                                        fontStyle: FontStyle.normal),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15.w,),
                                          InkWell(
                                            onTap: (){
                                              setstate(() {
                                                if(arabic){
                                                  english = false;
                                                }
                                                else{
                                                  arabic = true;
                                                  english = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 30.h,
                                              color: arabic == true ? ColorUtils.black : ColorUtils.containerColor,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 2.h),
                                                child: Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Text(
                                                    "العربية",
                                                    style: TextStyle(
                                                        fontFamily: FontUtils.almarenaRegular,
                                                        color: arabic == true ? ColorUtils.white : ColorUtils.dividerColor,
                                                        fontSize: 16.sp,
                                                        fontStyle: FontStyle.normal),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25.h,),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(ImageUtils.notification, scale: 3,),
                                          SizedBox(width: 10.w,),
                                          Text(
                                            "Allow Notifications",
                                            style: TextStyle(
                                                color: ColorUtils.dividerColor,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                      Image.asset(ImageUtils.switchon, scale: 3,)
                                    ],
                                  ),
                                  SizedBox(height: 6.h,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 27.w),
                                    child: Text(
                                      "Be Notified about our new arrivals, exclusive collections, the latest offers and more exciting updates from Maraya",
                                      style: TextStyle(
                                          color: ColorUtils.hintColor,
                                          fontFamily: FontUtils.almarenaRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  SizedBox(height: 25.h,),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(ImageUtils.ads, scale: 3,),
                                          SizedBox(width: 10.w,),
                                          Text(
                                            "Personalized Ads",
                                            style: TextStyle(
                                                color: ColorUtils.dividerColor,
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                      Image.asset(ImageUtils.switchoff, scale: 3,)
                                    ],
                                  ),
                                  SizedBox(height: 6.h,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 27.w),
                                    child: Text(
                                      "See the ads you want and allow Maraya to deliver personalized ads on other apps an websites",
                                      style: TextStyle(
                                          color: ColorUtils.hintColor,
                                          fontFamily: FontUtils.almarenaRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp),
                                    ),
                                  ),

                                  SizedBox(height: 50.h,),


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
                                              "Sign Out",
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
                                  SizedBox(height: 20.h,),
                                  InkWell(
                                    onTap: (){
                                      DeleteAccount();
                                    },
                                    child: Center(
                                      child:  Text(
                                        "Delete Account",
                                        style: TextStyle(
                                            color: ColorUtils.dividerColor,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.underline,
                                            decorationColor: ColorUtils.dotGreen,
                                            fontFamily: FontUtils.almarenaBold,
                                            fontSize: 14.sp),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  });
            }
            else if(categories[index]['title'] == "Contact Us"){
              showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  // useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: StatefulBuilder(
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
                                       "Contact Us",
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
                                  SizedBox(height: 40.h,),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                                              "Message us on Whatsapp",
                                              style: TextStyle(
                                                  color: ColorUtils.white,
                                                  fontFamily: FontUtils.almarenaDisplayRegular,
                                                  fontSize: 20.sp),
                                            ),
                                            SizedBox(width: 10.w,),
                                            Image.asset(ImageUtils.whatsapp, scale: 1.6, color: ColorUtils.white,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h,),
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
                                              "Visit our Flagship Outlet",
                                              style: TextStyle(
                                                  color: ColorUtils.black,
                                                  fontFamily: FontUtils.almarenaDisplayRegular,
                                                  fontSize: 20.sp),
                                            ),
                                            SizedBox(width: 10.w,),
                                            Icon(Icons.arrow_forward_sharp, size: 20, color: ColorUtils.black,)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 30.w,
                              child: Image.asset(categories[index]["image"], scale: 3.5,)),
                          SizedBox(width: 15.w,),
                          Text(
                            categories[index]["title"],
                            style: TextStyle(
                                color: ColorUtils.dividerColor,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Colors.black,
                          size: 30.0,
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
        // useRootNavigator: true,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setstate){
                return KeyboardActions(
                  config: _buildConfig(context),
                  child: Container(
                    // height: 300.h,
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(color: ColorUtils.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50.h,),
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
            ),
          );
        });
  }
  void DeleteAccount(){
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        // useRootNavigator: true,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: StatefulBuilder(
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
            ),
          );
        });
  }
  void DeleteCard(){
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      // useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
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
          ),
        );
      },
    );
  }
  void AddNewCard(){
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      // useRootNavigator: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
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
          ),
        );
      },
    );
  }



}
