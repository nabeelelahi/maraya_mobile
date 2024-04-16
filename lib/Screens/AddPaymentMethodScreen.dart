import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:maraya_flutter/Screens/FilterScreen.dart';
import 'package:maraya_flutter/Screens/HomeScreen.dart';
import 'package:maraya_flutter/Screens/ProductDetailScreen.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';
import 'CompleteOrderScreen.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  static const String route = "AddPaymentMethodScreen";
  AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _AddPaymentMethodScreenState createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {

  late BuildContext _context;
  FocusNode Name = FocusNode(), Number = FocusNode(),
      CVV = FocusNode(), Expire = FocusNode();
  String? name, number, cvv, expire;

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode(), FocusNode(), FocusNode()];

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _focusNodes[0]),
        KeyboardActionsItem(focusNode: _focusNodes[1]),
        KeyboardActionsItem(focusNode: _focusNodes[2]),
        KeyboardActionsItem(focusNode: _focusNodes[3])
      ],
    );
  }

  TextEditingController nameTextController = TextEditingController(),
      numberNameController = TextEditingController(),
      cvvNameController = TextEditingController(),
      expireTextController = TextEditingController();

  final GlobalKey<FormState> _formKey =
  GlobalKey<FormState>(debugLabel: 'AddPaymentMethodScreen');
  bool autoValidate = false;
  bool termsAndConditionCheck = false;
  bool show = false;
  bool cardSelected = false;

  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: AddPaymentMethodScreen');
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
            size: 20.0,
          ),
        ),
        titleSpacing: -13.w,
        title: Text("Payment Method") ,
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
        child: KeyboardActions(
          config: _buildConfig(context),
          child: Container(
              decoration: BoxDecoration(color: ColorUtils.white),
              child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: body())),
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    "Credit / Debit Card",
                    style: TextStyle(
                        color: ColorUtils.dividerColor,
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 14.sp),
                  ),
                  SizedBox(width: 5.w,),
                  Image.asset(ImageUtils.visa, scale: 3,),
                  SizedBox(width: 5.w,),
                  Image.asset(ImageUtils.master, scale: 3,),
                  SizedBox(width: 5.w,),
                  Image.asset(ImageUtils.mada, scale: 3,)
                ],
              ),
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    builder: (context) {
                      return Container(
                        height: 170.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                          child: Column(
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
                                        "********1234",
                                        style: TextStyle(
                                            color: ColorUtils.dividerColor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontUtils.almarenaRegular,
                                            fontSize: 14.sp),),
                                      SizedBox(width: 10.w,),
                                      Image.asset(ImageUtils.master, scale: 3,)
                                    ],
                                  ),
                                  Image.asset(ImageUtils.checkbox, scale: 1.7,)
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
                                            fontSize: 14.sp),),
                                      SizedBox(width: 10.w,),
                                      Image.asset(ImageUtils.visa, scale: 3,)
                                    ],
                                  ),
                                  Image.asset(ImageUtils.empty_checkbox, scale: 1.7,)
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
                                        "********9123",
                                        style: TextStyle(
                                            color: ColorUtils.dividerColor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: FontUtils.almarenaRegular,
                                            fontSize: 14.sp),),
                                      SizedBox(width: 10.w,),
                                      Image.asset(ImageUtils.mada, scale: 3,)
                                    ],
                                  ),
                                  Image.asset(ImageUtils.empty_checkbox, scale: 1.7,)
                                ],
                              ),
                              SizedBox(height: 20.h,),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    cardSelected = true;
                                    nameTextController.text = "Emma Richard";
                                    numberNameController.text = "**** **** **** 1234";
                                    cvvNameController.text = "123";
                                    expireTextController.text = "12/25";
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 42.h,
                                  color: ColorUtils.dividerColor,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Select",
                                          style: TextStyle(
                                              color: ColorUtils.white,
                                              fontFamily: FontUtils.almarenaDisplayRegular,
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
                child: Text(
                  "Change",
                  style: TextStyle(
                      color: ColorUtils.black,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorUtils.dotGreen,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 16.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          InkWell(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                builder: (context) {
                  return Container(
                    height: 170.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                      child: Column(
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
                                    "********1234",
                                    style: TextStyle(
                                        color: ColorUtils.dividerColor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 14.sp),),
                                  SizedBox(width: 10.w,),
                                  Image.asset(ImageUtils.master, scale: 3,)
                                ],
                              ),
                              Image.asset(ImageUtils.checkbox, scale: 1.7,)
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
                                        fontSize: 14.sp),),
                                  SizedBox(width: 10.w,),
                                  Image.asset(ImageUtils.visa, scale: 3,)
                                ],
                              ),
                              Image.asset(ImageUtils.empty_checkbox, scale: 1.7,)
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
                                    "********9123",
                                    style: TextStyle(
                                        color: ColorUtils.dividerColor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontUtils.almarenaRegular,
                                        fontSize: 14.sp),),
                                  SizedBox(width: 10.w,),
                                  Image.asset(ImageUtils.mada, scale: 3,)
                                ],
                              ),
                              Image.asset(ImageUtils.empty_checkbox, scale: 1.7,)
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                cardSelected = true;
                                nameTextController.text = "Emma Richard";
                                numberNameController.text = "**** **** **** 1234";
                                cvvNameController.text = "123";
                                expireTextController.text = "12/25";
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 42.h,
                              color: ColorUtils.dividerColor,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Select",
                                      style: TextStyle(
                                          color: ColorUtils.white,
                                          fontFamily: FontUtils.almarenaDisplayRegular,
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              color: ColorUtils.listColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        cardSelected == true ? "*******1234" : "Saved Cards",
                        style: TextStyle(
                            color: ColorUtils.dividerColor,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 18.sp),
                      ),
                      Visibility(
                        visible: cardSelected,
                          child: SizedBox(width: 5.w,)),
                      Visibility(
                          visible: cardSelected,
                          child: Image.asset(ImageUtils.master, scale: 2.5,)),
                    ],
                  ),

                  Icon(
                    Icons.arrow_forward_ios,
                    color: ColorUtils.dividerColor,
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          Text(
            "Enter Card Details",
            style: TextStyle(
                color: ColorUtils.black,
                fontFamily: FontUtils.almarenaBold,
                fontSize: 16.sp),
          ),
          SizedBox(height: 15.h,),
          Form(
            key: _formKey,
            autovalidateMode: autoValidate
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                        controller: numberNameController,
                        currentFocus: _focusNodes[1],
                        nextFocus: _focusNodes[2],
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
                        controller: cvvNameController,
                        currentFocus: _focusNodes[2],
                        nextFocus: _focusNodes[3],
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
                  controller: expireTextController,
                  currentFocus: _focusNodes[3],
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  bordercolor: ColorUtils.white,
                  onSaved: (text) {},
                  onChange: (text) {},
                ),
                SizedBox(height: 15.h,),
                InkWell(
                  onTap: (){
                    setState(() {
                      termsAndConditionCheck = !termsAndConditionCheck;
                    });
                  },
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              termsAndConditionCheck = !termsAndConditionCheck;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: termsAndConditionCheck == true
                                    ? ColorUtils.black
                                    : ColorUtils.paleGrey,
                                border: Border.all(
                                    width: 2.w,
                                    color:
                                    termsAndConditionCheck == true
                                        ? ColorUtils.black
                                        : ColorUtils.black)),
                            child: Icon(
                              termsAndConditionCheck == true
                                  ? Icons.check
                                  : null,
                              size: 13,
                              color: ColorUtils.white,
                            ),
                          )),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("Save this card for a faster checkout next time",
                          style: TextStyle(
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 14.sp,
                              color: ColorUtils.dividerColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          InkWell(
            onTap: (){
              setState(() {
                if(show){
                  show = false;
                }
                else{
                  show = true;
                }
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "View Bag",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaBold,
                          fontSize: 16.sp),
                    ),
                    Icon(
                      show == false ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                  color: ColorUtils.black,
                  thickness: 2,
                ),
              ],
            ),
          ),
          Visibility(
            visible: show,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Image.asset(ImageUtils.pencil, scale: 1.8,)
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
              ],
            ),
          ),
          SizedBox(height: 30.h,),
          InkWell(
            onTap: (){
              // Navigator.of(context, rootNavigator: false)
              //     .push(MaterialPageRoute(builder: (context) =>
              //     CompleteOrderScreen()));
              // Navigator.pop(context);
              Navigator.pop(context, "card");
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
                    SizedBox(width: 5.w,),
                    Image.asset(ImageUtils.lock, scale: 3,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h,)

        ],
      ),
    );
  }
}
