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

class RegisterScreen extends StatefulWidget {
  static const String route = "RegisterScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late BuildContext _context;
  FocusNode firstName = FocusNode(), secondName = FocusNode(),
      phone = FocusNode(), email = FocusNode();
  String? Email, FirstName, SecondName, Phone, DateOfBirth;
  bool termsAndConditionCheck = false;

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode(), FocusNode()];

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

  TextEditingController emailTextController = TextEditingController(),
      firstNameController = TextEditingController(),
      SecondNameController = TextEditingController(),
      DateofBirthController = TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_RegisterScreen');
  bool autoValidate = false, obscure = true;

  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);


    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: RegisterScreen');
    _context = context;
    return Scaffold(
      backgroundColor: ColorUtils.white,
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
      children: [
        Stack(
          children: [
            Container(
              height: 210.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorUtils.white,
                image: DecorationImage(
                  image: AssetImage(ImageUtils.registerImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              color: ColorUtils.black.withOpacity(0.30),
              height: 210.h,
              width: double.infinity,
            ),
            Positioned(
              bottom: 10.h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    translate('strings.Register'),
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        color: ColorUtils.white,
                        fontSize: 40.sp,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
        Form(
          key: _formKey,
          autovalidateMode: autoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.h,
                ),
                Text(translate('strings.Title'),
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 18.sp,
                        color: ColorUtils.hintColor)),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 3.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(ImageUtils.checkbox, scale: 1.6,),
                        SizedBox(width: 5.w,),
                        Text(translate('strings.Mr'),
                            style: TextStyle(
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 18.sp,
                                color: ColorUtils.dividerColor)),
                      ],
                    ),
                    SizedBox(width: 25.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(ImageUtils.checkbox, scale: 1.6,),
                        SizedBox(width: 5.w,),
                        Text(translate('strings.Mrs'),
                            style: TextStyle(
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 18.sp,
                                color: ColorUtils.dividerColor)),
                      ],
                    ),
                    SizedBox(width: 25.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(ImageUtils.checkbox, scale: 1.6,),
                        SizedBox(width: 5.w,),
                        Text(translate('strings.Miss'),
                            style: TextStyle(
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 18.sp,
                                color: ColorUtils.dividerColor)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
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
                        currentFocus: _focusNodes[0],
                        nextFocus: _focusNodes[1],
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
                        currentFocus: _focusNodes[1],
                        nextFocus: _focusNodes[2],
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
                      hintText: translate('strings.PhoneNumber'),
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
                  currentFocus: _focusNodes[2],
                  bordercolor: ColorUtils.white,
                  // labelText: StringUtils.EMAIL,
                  onSaved: (text) {
                    Email = text;
                  },
                  onChange: (text) {
                    Email = text;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                EditText(
                  context: context,
                  hintText: translate('strings.DateOfBirth'),
                  validator: validateEventName,
                  controller: DateofBirthController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  prefixIcon: ImageUtils.calendar,
                  suffixIcon: ImageUtils.info,
                  bordercolor: ColorUtils.white,
                  suffixClick: ShowDialog,
                  readonly: true,
                  ONTAP: () async {
                    BottomPicker.date(
                      title:  "",
                      titleStyle:  TextStyle(
                          fontWeight:  FontWeight.bold,
                          fontSize:  15,
                          color:  Colors.black
                      ),
                      onSubmit: (date) {
                        print(date);
                        var check = date;
                        if(check == null){

                        }
                        else{
                          setState(() {
                            DateofBirthController.text = check.toString().split(" ")[0];
                            // DateDuration duration;
                            // duration = AgeCalculator.age(DateTime.parse(check.toString().split(" ")[0]));
                            // print(duration);
                            // ageTextController.text = duration.years.toString();
                          });
                        }
                      },
                      onClose: () {
                        print("Picker closed");
                      },
                      // buttonText:  'Confirm',
                      // buttonTextStyle:  const  TextStyle(
                      //     color:  Colors.white
                      // ),
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
                  onSaved: (text) {
                    DateOfBirth = text;
                  },
                  onChange: (text) {
                    DateOfBirth = text;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: InkWell(
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
                        Text("I agree to ",
                            style: TextStyle(
                                fontFamily: FontUtils.almarenaRegular,
                                fontSize: 16.sp,
                                color: ColorUtils.dividerColor)),
                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            child: Text("terms & conditions",
                                style: TextStyle(
                                    fontFamily: FontUtils.almarenaRegular,
                                    decoration: TextDecoration.underline,
                                    fontSize: 16.sp,
                                    color: ColorUtils.dividerColor)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                MyButton(
                  text: translate('strings.SignUp'),
                  textColor: ColorUtils.white,
                  circularRadius: 0,
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.Verfication);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translate('strings.AlreadyHaveAnAccount'),
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 16.sp),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, AppRoutes.Login);
                        },
                        child: Text(
                          translate('strings.Login'),
                          style: TextStyle(
                            color: ColorUtils.black,
                            decoration: TextDecoration.underline,
                            fontFamily: FontUtils.almarenaRegular,
                            fontSize: 16.sp,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    translate('strings.ContinueAsGuest'),
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorUtils.dotGreen,
                        color: ColorUtils.dividerColor,
                        fontSize: 18.sp,
                        fontStyle: FontStyle.normal),
                  ),
                ),
                SizedBox(height: 15.h,),
              ],
            ),
          ),
        ),
      ],
    );
  }


  void ShowDialog(){
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(11)),
            insetPadding: EdgeInsets.symmetric(
                horizontal: 15.w,vertical: 10.h),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.w, vertical: 1.h),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 30.h, bottom: 30.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Add reason for collecting birthday dates here",
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
