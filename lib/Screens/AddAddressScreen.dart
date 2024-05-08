import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:country_picker/country_picker.dart';
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
      apartment = FocusNode(), phone = FocusNode();
  String? Email, FirstName, SecondName, Phone, City, Area, Address, Apartment;
  bool termsAndConditionCheck = false;

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode(), FocusNode(), FocusNode(), FocusNode(),
    FocusNode(), FocusNode(),  FocusNode(), FocusNode(),];

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
        KeyboardActionsItem(focusNode: _focusNodes[8]),
      ],
    );
  }

  TextEditingController emailTextController = TextEditingController(),
      firstNameController = TextEditingController(),
      SecondNameController = TextEditingController(),
      cityTextController = TextEditingController(),
      areaTextController = TextEditingController(),
      phoneTextController = TextEditingController(),
      addressTextController = TextEditingController(),
      apartmentTextController = TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_AddAddressScreen');
  bool autoValidate = false, obscure = true;
  List<Map<String,dynamic>> filterlist = [];
  String code = "+966";
  List<String> cities = ["Riyadh", "Jeddah"];
  List<String> areas = ["Riyadh", "Jeddah"];

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
        title: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Text("Shipping Address")) ,
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
                  scale: 2.5)),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
              SizedBox(height: 10.h,),
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
                      // nextFocus: _focusNodes[4],
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      bordercolor: ColorUtils.white,
                      onSaved: (text) {},
                      onChange: (text) {},
                    ),
                    SizedBox(height: 30.h,),
                    MyButton(
                      text: "Review Order",
                      textColor: ColorUtils.white,
                      circularRadius: 0,
                      onPress: () {
                        Navigator.pop(context, "review");
                        // showModalBottomSheet(
                        //   context: context,
                        //   isDismissible: true,
                        //   builder: (context) {
                        //     return Container(
                        //       height: 170.h,
                        //       child: Padding(
                        //         padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                        //         child: Column(
                        //           children: [
                        //             Padding(
                        //               padding: EdgeInsets.symmetric(vertical: 10.h),
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   SizedBox(
                        //                     width: 310.w,
                        //                     child: Text(
                        //                       "Add a name for this delivery address",
                        //                       style: TextStyle(
                        //                           color: ColorUtils.dividerColor,
                        //                           fontWeight: FontWeight.w400,
                        //                           fontFamily: FontUtils.almarenaRegular,
                        //                           fontSize: 18.sp),),
                        //                   ),
                        //                   InkWell(
                        //                     onTap: (){
                        //                       Navigator.pop(context);
                        //                     },
                        //                       child: Image.asset(ImageUtils.cross, scale: 1.6,))
                        //                 ],
                        //               ),
                        //             ),
                        //             SizedBox(height: 15.h,),
                        //             EditText(
                        //               context: context,
                        //               hintText: "Home*",
                        //               validator: validateEventName,
                        //               controller: firstNameController,
                        //               textInputType: TextInputType.text,
                        //               textInputAction: TextInputAction.done,
                        //               // currentFocus: _focusNodes[4],
                        //               // nextFocus: _focusNodes[5],
                        //               bordercolor: ColorUtils.white,
                        //               // labelText: StringUtils.EMAIL,
                        //               onSaved: (text) {
                        //                 // FirstName = text;
                        //               },
                        //               onChange: (text) {
                        //                 // FirstName = text;
                        //               },
                        //             ),
                        //             SizedBox(height: 15.h,),
                        //             InkWell(
                        //               onTap: (){
                        //                 Navigator.pop(context);
                        //                 Navigator.pop(context, "review");
                        //               },
                        //               child: Container(
                        //                 width: double.infinity,
                        //                 height: 42.h,
                        //                 color: ColorUtils.dividerColor,
                        //                 child: Center(
                        //                   child: Row(
                        //                     mainAxisAlignment: MainAxisAlignment.center,
                        //                     crossAxisAlignment: CrossAxisAlignment.center,
                        //                     children: [
                        //                       Text(
                        //                         "Save and Continue",
                        //                         style: TextStyle(
                        //                             color: ColorUtils.white,
                        //                             fontFamily: FontUtils.almarenaDisplayRegular,
                        //                             fontSize: 20.sp),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // );
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
    );
  }



}
