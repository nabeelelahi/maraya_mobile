import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
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

class EditProfile extends StatefulWidget {
  static const String route = "EditProfile";

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String selected = "Miss";
  TextEditingController emailTextController = TextEditingController(),
      firstNameController = TextEditingController(),
      SecondNameController = TextEditingController(),
      phoneTextController = TextEditingController(),
      DateofBirthController = TextEditingController();
  String? Email, FirstName, SecondName, Phone, DateOfBirth;
  String code = "+966";


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);


    setState(() {
      firstNameController.text = "Alexa";
      SecondNameController.text = "Smith";
      phoneTextController.text = "566 364 799";
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: EditProfile');
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
        title: Text("Edit Profile") ,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: body()))),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(
                  color: ColorUtils.hintColor,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 12.sp),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Miss Alexa Smith",
                  style: TextStyle(
                      color: ColorUtils.black,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 16.sp),
                ),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState){
                                return Container(
                                  height: 260.h,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(translate('strings.Title'),
                                            style: TextStyle(
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp,
                                                color: ColorUtils.hintColor)),
                                        SizedBox(height: 10.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 3.w,),
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  selected = "Mr";
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  selected == "Mr" ? Image.asset(ImageUtils.checkbox, scale: 3,) :
                                                  Image.asset(ImageUtils.empty_checkbox, scale: 3,),
                                                  SizedBox(width: 5.w,),
                                                  Text(translate('strings.Mr'),
                                                      style: TextStyle(
                                                          fontFamily: FontUtils.almarenaRegular,
                                                          fontSize: 18.sp,
                                                          color: ColorUtils.dividerColor)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 25.w,),
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  selected = "Mrs";
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  selected == "Mrs" ? Image.asset(ImageUtils.checkbox, scale: 3,) :
                                                  Image.asset(ImageUtils.empty_checkbox, scale: 3,),
                                                  SizedBox(width: 5.w,),
                                                  Text(translate('strings.Mrs'),
                                                      style: TextStyle(
                                                          fontFamily: FontUtils.almarenaRegular,
                                                          fontSize: 18.sp,
                                                          color: ColorUtils.dividerColor)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 25.w,),
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  selected = "Miss";
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  selected == "Miss" ? Image.asset(ImageUtils.checkbox, scale: 3,) :
                                                  Image.asset(ImageUtils.empty_checkbox, scale: 3,),
                                                  SizedBox(width: 5.w,),
                                                  Text(translate('strings.Miss'),
                                                      style: TextStyle(
                                                          fontFamily: FontUtils.almarenaRegular,
                                                          fontSize: 18.sp,
                                                          color: ColorUtils.dividerColor)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("First Name",
                                                    style: TextStyle(
                                                        fontFamily: FontUtils.almarenaRegular,
                                                        fontSize: 14.sp,
                                                        color: ColorUtils.hintColor)),
                                                SizedBox(height: 10.h,),
                                                SizedBox(
                                                  width: 150.w,
                                                  height: 35.h,
                                                  child: EditText(
                                                    context: context,
                                                    hintText: translate('strings.FirstName'),
                                                    validator: validateEventName,
                                                    controller: firstNameController,
                                                    textInputType: TextInputType.text,
                                                    textInputAction: TextInputAction.next,
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
                                              ],
                                            ),
                                            SizedBox(width: 15.w,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Last Name",
                                                    style: TextStyle(
                                                        fontFamily: FontUtils.almarenaRegular,
                                                        fontSize: 14.sp,
                                                        color: ColorUtils.hintColor)),
                                                SizedBox(height: 10.h,),
                                                SizedBox(
                                                  width: 150.w,
                                                  height: 35.h,
                                                  child: EditText(
                                                    context: context,
                                                    hintText: "Last Name",
                                                    validator: validateEventName,
                                                    controller: SecondNameController,
                                                    textInputType: TextInputType.text,
                                                    textInputAction: TextInputAction.next,
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
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 40.h,),
                                        MyButton(
                                          text: "Save",
                                          textColor: ColorUtils.white,
                                          circularRadius: 0,
                                          onPress: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.edit,
                    color: ColorUtils.dividerColor,
                    size: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h,),

            Text(
              "Phone Number",
              style: TextStyle(
                  color: ColorUtils.hintColor,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 12.sp),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "+966 566 364 799",
                  style: TextStyle(
                      color: ColorUtils.black,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 16.sp),
                ),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        // useRootNavigator: false,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState){
                                return Container(
                                  height: 200.h,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Phone Number",
                                            style: TextStyle(
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp,
                                                color: ColorUtils.hintColor)),
                                        SizedBox(height: 10.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                showCountryPicker(
                                                    context: context,
                                                    countryListTheme: CountryListThemeData(
                                                      flagSize: 25,
                                                      backgroundColor: Colors.white,
                                                      textStyle: TextStyle(fontSize: 16, color: ColorUtils.dividerColor),
                                                      bottomSheetHeight: 500, // Optional. Country list modal height
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20.0),
                                                        topRight: Radius.circular(20.0),
                                                      ),
                                                      //Optional. Styles the search field.
                                                      inputDecoration: InputDecoration(
                                                        labelText: 'Search',
                                                        hintText: 'Start typing to search',
                                                        prefixIcon: const Icon(Icons.search),
                                                        border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    onSelect: (Country country){
                                                      setState(() {
                                                        print('Select country: ${country.phoneCode}');
                                                        code = "+ ${country.phoneCode.toString()}";
                                                      });

                                                    }
                                                );
                                              },
                                              child: Container(
                                                width: 90.w,
                                                height: 42.h,
                                                padding: EdgeInsets.only(top: 9.2.h),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Image.asset(ImageUtils.downarrow, scale: 2.5,),
                                                        SizedBox(width: 10.w,),
                                                        Text(
                                                          code ?? "",
                                                          style: TextStyle(
                                                            // height: 1,
                                                            fontSize:  18.sp,
                                                            color: ColorUtils.dividerColor,
                                                            fontFamily:  FontUtils.almarenaRegular,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5.h,),
                                                    Divider(
                                                      height: 0.5.h,
                                                      color: ColorUtils.dividerColor,
                                                      thickness: 1.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 42.h,
                                              width: 220.w,
                                              child: EditText(
                                                context: context,
                                                hintText: "Phone Number",
                                                controller: phoneTextController,
                                                textInputType: TextInputType.number,
                                                textInputAction: TextInputAction.done,
                                                bordercolor: ColorUtils.white,
                                                onSaved: (text) {
                                                  // SecondName = text;
                                                },
                                                onChange: (text) {
                                                  // SecondName = text;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 40.h,),
                                        MyButton(
                                          text: "Save",
                                          textColor: ColorUtils.white,
                                          circularRadius: 0,
                                          onPress: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.edit,
                    color: ColorUtils.dividerColor,
                    size: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h,),

            Text(
              "Email",
              style: TextStyle(
                  color: ColorUtils.hintColor,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 12.sp),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "None Added",
                  style: TextStyle(
                      color: ColorUtils.red,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 16.sp),
                ),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        // useRootNavigator: false,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState){
                                return Container(
                                  height: 200.h,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Email Address",
                                            style: TextStyle(
                                                fontFamily: FontUtils.almarenaRegular,
                                                fontSize: 14.sp,
                                                color: ColorUtils.hintColor)),
                                        SizedBox(height: 10.h,),
                                        EditText(
                                          context: context,
                                          hintText: "Enter Email Address",
                                          validator: validateEventName,
                                          controller: emailTextController,
                                          textInputType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          bordercolor: ColorUtils.white,
                                          // labelText: StringUtils.EMAIL,
                                          onSaved: (text) {
                                            Email = text;
                                          },
                                          onChange: (text) {
                                            Email = text;
                                          },
                                        ),
                                        SizedBox(height: 40.h,),
                                        MyButton(
                                          text: "Save",
                                          textColor: ColorUtils.white,
                                          circularRadius: 0,
                                          onPress: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.edit,
                    color: ColorUtils.dividerColor,
                    size: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h,),

            Text(
              "Date of Birth",
              style: TextStyle(
                  color: ColorUtils.hintColor,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 12.sp),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "January 1st, 2000",
                  style: TextStyle(
                      color: ColorUtils.black,
                      fontFamily: FontUtils.almarenaRegular,
                      fontSize: 16.sp),
                ),
                InkWell(
                  onTap: (){
                    BottomPicker.date(
                      height: MediaQuery.of(context).size.height,
                      title:  "",
                      dateOrder: DatePickerDateOrder.dmy,
                      titleStyle:  TextStyle(
                          fontWeight:  FontWeight.bold,
                          fontSize:  15,
                          color:  Colors.black
                      ),
                      pickerTextStyle:  TextStyle(
                          fontWeight:  FontWeight.w400,
                          fontSize:  17.sp,
                          color:  Colors.black
                      ),
                      onSubmit: (date) {
                        print(date);
                        var check = date;
                        if(check == null){

                        }
                        else{
                          setState(() {
                          });
                        }
                      },
                      onClose: () {
                        print("Picker closed");
                      },
                      buttonSingleColor:  ColorUtils.black,
                      buttonContent: Container(
                        height: 20.h,
                        width: 80.w,
                        color: ColorUtils.black,
                        child: Center(
                          child: Text(
                            "Select",
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 18.sp),
                          ),
                        ),
                      ),
                      minDateTime:  DateTime(1900, 1, 1),
                      maxDateTime:  DateTime.now(),
                      initialDateTime: DateTime(1900, 1, 1),
                    ).show(context);
                  },
                  child: Icon(
                    Icons.edit,
                    color: ColorUtils.dividerColor,
                    size: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h,),
          ],
        )

      ],
    );
  }





}
