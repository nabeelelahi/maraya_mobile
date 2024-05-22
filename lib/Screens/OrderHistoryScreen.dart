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
import 'package:maraya_flutter/Screens/ViewOrderScreen.dart';
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

class OrderHistoryScreen extends StatefulWidget {
  static const String route = "OrderHistoryScreen";

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

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
    print('State: OrderHistoryScreen');
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
        title: Text("Order History") ,
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
          child: Text(
            "On-Going Orders",
            style: TextStyle(
                color: ColorUtils.black,
                fontFamily: FontUtils.almarenaRegular,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 10.h,),
        _renderSteps(),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 15.w),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Text(
        //             "Order # 1234",
        //             style: TextStyle(
        //                 color: ColorUtils.dividerColor,
        //                 fontFamily: FontUtils.almarenaRegular,
        //                 fontWeight: FontWeight.w400,
        //                 fontSize: 16.sp),
        //           ),
        //           Text(
        //             "Status: In Delivery",
        //             style: TextStyle(
        //                 color: ColorUtils.dividerColor,
        //                 fontFamily: FontUtils.almarenaRegular,
        //                 fontWeight: FontWeight.w700,
        //                 fontSize: 12.sp),
        //           ),
        //         ],
        //       ),
        //       SizedBox(height: 15.h,),
        //       Text(
        //         "Order Placed on 9 May",
        //         style: TextStyle(
        //             color: ColorUtils.hintColor,
        //             fontFamily: FontUtils.almarenaRegular,
        //             fontWeight: FontWeight.w400,
        //             fontSize: 12.sp),
        //       ),
        //       SizedBox(height: 10.h,),
        //       Text(
        //         "Price: 2,000 SAR",
        //         style: TextStyle(
        //             color: ColorUtils.hintColor,
        //             fontFamily: FontUtils.almarenaRegular,
        //             fontWeight: FontWeight.w400,
        //             fontSize: 12.sp),
        //       ),
        //       SizedBox(height: 15.h,),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Text(
        //             "Long-sleeve Max...",
        //             style: TextStyle(
        //                 color: ColorUtils.hintColor,
        //                 fontFamily: FontUtils.almarenaRegular,
        //                 fontWeight: FontWeight.w400,
        //                 fontSize: 12.sp),
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "View Order",
        //                 style: TextStyle(
        //                     color: ColorUtils.dividerColor,
        //                     fontFamily: FontUtils.almarenaRegular,
        //                     fontWeight: FontWeight.w400,
        //                     decoration: TextDecoration.underline,
        //                     decorationColor: ColorUtils.dotGreen,
        //                     fontSize: 12.sp),
        //               ),
        //               Icon(
        //                 Icons.keyboard_arrow_right_sharp,
        //                 color: ColorUtils.dividerColor,
        //                 size: 16.0,
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //
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
        return  InkWell(
          onTap: (){
            Navigator.of(context, rootNavigator: true)
                .push(MaterialPageRoute(builder: (context) =>
                ViewOrderScreen()));
          },
          child: Container(
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
