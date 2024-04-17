import 'dart:io';
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

class LoginScreen extends StatefulWidget {
  static const String route = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late BuildContext _context;
  FocusNode emailFocus = FocusNode(), passFocus = FocusNode();
  String? code, pass;
  String countryValue = "";

  final List<FocusNode> _focusNodes = [FocusNode()];

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _focusNodes[0]),
      ],
    );
  }

  TextEditingController phone = TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_LoginScreen');
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
    setState(() {
      code = "+966";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: LoginScreen');
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
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorUtils.white,
                image: DecorationImage(
                  image: AssetImage(ImageUtils.loginImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              color: ColorUtils.black.withOpacity(0.30),
              height: 300.h,
              width: double.infinity,
            ),
            Positioned(
              bottom: 10.h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    translate('strings.WelcomeToMaraya'),
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        color: ColorUtils.white,
                        fontSize: 40.sp,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
            )
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        height: 40.h,
                        padding: EdgeInsets.symmetric(vertical: 7.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(ImageUtils.downarrow, scale: 2,),
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
                              height: 3.h,
                              color: ColorUtils.dividerColor,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 220.w,
                      child: EditText(
                        context: context,
                        hintText: "Phone Number",
                        currentFocus: _focusNodes[0],
                        controller: phone,
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
                SizedBox(
                  height: 15.h,
                ),
                MyButton(
                  text: translate('strings.Continue'),
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
                      translate('strings.DontHaveAccount'),
                      style: TextStyle(
                          color: ColorUtils.black,
                          fontFamily: FontUtils.almarenaRegular,
                          fontSize: 16.sp),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.Register);
                        },
                        child: Text(
                          translate('strings.Register'),
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
                  height: 160.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    translate('strings.ContinueAsGuest'),
                    style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        decoration: TextDecoration.underline,
                        color: ColorUtils.dividerColor,
                        decorationColor: ColorUtils.dotGreen,
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



}
