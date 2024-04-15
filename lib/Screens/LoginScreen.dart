import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
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
  String? email, pass;

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode()];

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _focusNodes[0]),
        KeyboardActionsItem(focusNode: _focusNodes[1])
      ],
    );
  }

  TextEditingController emailTextController = TextEditingController(),
      passwordTextController = TextEditingController();

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
