import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:oktoast/oktoast.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';

class AddAddressScreen extends StatefulWidget {
  static const String route = "AddAddressScreen";

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {

  late BuildContext _context;
  FocusNode firstName = FocusNode(), secondName = FocusNode(),
      email = FocusNode(), city = FocusNode(), area = FocusNode(), address = FocusNode(),
      apartment = FocusNode();
  String? Email, FirstName, SecondName, Phone, City, Area, Address, Apartment;
  bool termsAndConditionCheck = false;

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode(), FocusNode(), FocusNode(), FocusNode(),
    FocusNode(), FocusNode(),  FocusNode(),];

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _focusNodes[0]),
        KeyboardActionsItem(focusNode: _focusNodes[1]),
        KeyboardActionsItem(focusNode: _focusNodes[2]),
        KeyboardActionsItem(focusNode: _focusNodes[3]),
        KeyboardActionsItem(focusNode: _focusNodes[4]),
        KeyboardActionsItem(focusNode: _focusNodes[5]),
        KeyboardActionsItem(focusNode: _focusNodes[6]),
        KeyboardActionsItem(focusNode: _focusNodes[7]),
      ],
    );
  }

  TextEditingController emailTextController = TextEditingController(),
      firstNameController = TextEditingController(),
      SecondNameController = TextEditingController(),
      cityTextController = TextEditingController(),
      areaTextController = TextEditingController(),
      addressTextController = TextEditingController(),
      apartmentTextController = TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_AddAddressScreen');
  bool autoValidate = false, obscure = true;
  List<Map<String,dynamic>> filterlist = [];

  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);


    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }


    filterlist =[
      {
        "title": "Home",
        "state": true
      },
      {
        "title": "Office",
        "state": false
      },
      {
        "title": "Home2",
        "state": false
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: AddAddressScreen');
    _context = context;
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
        titleSpacing: -15.w,
        title: Text("Shipping Address") ,
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
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h,),
          Text(
            "Enter Delivery Details",
            style: TextStyle(
                color: ColorUtils.dividerColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontUtils.almarenaBold,
                fontSize: 16.sp),),
          SizedBox(height: 10.h,),
          Image.asset(ImageUtils.map,),
          Container(
            color: ColorUtils.dividerColor,
            width: double.infinity,
            // height: 20.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select on Map",
                  style: TextStyle(
                      color: ColorUtils.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontUtils.almarenaBold,
                      fontSize: 14.sp),),
                Icon(
                  Icons.arrow_forward,
                  color: ColorUtils.white,
                  size: 20.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          SizedBox(
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
                    InkWell(
                      onTap:(){
                        if(index == 0){
                          setState(() {
                            filterlist[0]["state"] = true;
                            filterlist[1]["state"] = false;
                            filterlist[2]["state"] = false;
                          });
                        }
                        else if (index == 1){
                          setState(() {
                            filterlist[1]["state"] = true;
                            filterlist[0]["state"] = false;
                            filterlist[2]["state"] = false;
                          });
                        }
                        else{
                          setState(() {
                            filterlist[2]["state"] = true;
                            filterlist[1]["state"] = false;
                            filterlist[0]["state"] = false;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: filterlist[index]["state"] == true ? ColorUtils.dividerColor : ColorUtils.white,
                          border: Border.all(
                            width: 1,
                            color: filterlist[index]["state"] == true ? ColorUtils.dividerColor : ColorUtils.dividerColor,
                          ),
                        ),
                        child: Text(
                          filterlist[index]["title"],
                          style: TextStyle(
                              color: filterlist[index]["state"] == true ? ColorUtils.white : ColorUtils.dividerColor,
                              fontFamily: FontUtils.almarenaRegular,
                              fontSize: 12.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,)
                  ],
                );
              },
              itemCount: filterlist.length,
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
                Text("City*",
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 16.sp,
                        color: ColorUtils.dividerColor)),
                EditText(
                  context: context,
                  hintText: "Riyadh",
                  controller: cityTextController,
                  currentFocus: _focusNodes[0],
                  nextFocus: _focusNodes[1],
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  bordercolor: ColorUtils.white,
                  onSaved: (text) {},
                  onChange: (text) {},
                ),
                SizedBox(height: 20.h,),
                Text("Area*",
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 16.sp,
                        color: ColorUtils.dividerColor)),
                EditText(
                  context: context,
                  hintText: "eg. AL Wazaraat",
                  controller: areaTextController,
                  currentFocus: _focusNodes[1],
                  nextFocus: _focusNodes[2],
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  bordercolor: ColorUtils.white,
                  onSaved: (text) {},
                  onChange: (text) {},
                ),
                SizedBox(height: 20.h,),
                Text("Delivery Address*",
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 16.sp,
                        color: ColorUtils.dividerColor)),
                EditText(
                  context: context,
                  hintText: "eg. 11 Kaiyuan Road",
                  controller: addressTextController,
                  currentFocus: _focusNodes[2],
                  nextFocus: _focusNodes[3],
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
                EditText(
                  context: context,
                  hintText: "eg. Apartment 2102",
                  controller: apartmentTextController,
                  currentFocus: _focusNodes[3],
                  nextFocus: _focusNodes[4],
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  bordercolor: ColorUtils.white,
                  onSaved: (text) {},
                  onChange: (text) {},
                ),
                SizedBox(height: 20.h,),
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
                      Text("Save this address for a faster checkout next time",
                          style: TextStyle(
                              fontFamily: FontUtils.almarenaLight,
                              fontSize: 14.sp,
                              color: ColorUtils.dividerColor)),
                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                Text(
                  "Enter Personal Details",
                  style: TextStyle(
                      color: ColorUtils.dividerColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontUtils.almarenaBold,
                      fontSize: 16.sp),),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 30.h,
                      child: EditText(
                        context: context,
                        hintText: translate('strings.FirstName'),
                        validator: validateEventName,
                        controller: firstNameController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        currentFocus: _focusNodes[4],
                        nextFocus: _focusNodes[5],
                        bordercolor: ColorUtils.white,
                        // labelText: StringUtils.EMAIL,
                        onSaved: (text) {
                          FirstName = text;
                        },
                        onChange: (text) {
                          FirstName = text;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150.w,
                      height: 30.h,
                      child: EditText(
                        context: context,
                        hintText: translate('strings.SecondName'),
                        validator: validateEventName,
                        controller: SecondNameController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        currentFocus: _focusNodes[5],
                        nextFocus: _focusNodes[6],
                        bordercolor: ColorUtils.white,
                        // labelText: StringUtils.EMAIL,
                        onSaved: (text) {
                          SecondName = text;
                        },
                        onChange: (text) {
                          SecondName = text;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Theme(
                  data: ThemeData(
                    primaryColor: ColorUtils.dividerColor,
                    accentColor: ColorUtils.dividerColor,
                    colorScheme: ColorScheme.light(primary: ColorUtils.dividerColor),
                    disabledColor: Colors.brown,
                    textTheme:
                    TextTheme(bodyText1: TextStyle(color: ColorUtils.dividerColor)),
                  ),
                  child: IntlPhoneField(
                    style: TextStyle(
                      height: Platform.isIOS ? 1.3 : 1.5,
                      fontSize:  18.sp,
                      color: ColorUtils.black,
                      fontFamily:  FontUtils.almarenaRegular,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                      hintText: "Phone Number*",
                      hintStyle: TextStyle(
                          fontFamily: FontUtils.almarenaRegular,
                          color: ColorUtils.hintColor,
                          fontSize: 16.sp, height: 1),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorUtils.dividerColor),),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorUtils.dividerColor),),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorUtils.dividerColor),),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorUtils.dividerColor),),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorUtils.dividerColor),),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorUtils.dividerColor),),
                    ),
                    initialCountryCode: 'SA',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
                EditText(
                  context: context,
                  hintText: translate('strings.Email'),
                  validator: validateEmail,
                  controller: emailTextController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  currentFocus: _focusNodes[7],
                  bordercolor: ColorUtils.white,
                  // labelText: StringUtils.EMAIL,
                  onSaved: (text) {
                    Email = text;
                  },
                  onChange: (text) {
                    Email = text;
                  },
                ),
                SizedBox(height: 30.h,),
                MyButton(
                  text: "Review Order",
                  textColor: ColorUtils.white,
                  circularRadius: 0,
                  onPress: () {
                    Navigator.pop(context, "review");
                  },
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }



}
