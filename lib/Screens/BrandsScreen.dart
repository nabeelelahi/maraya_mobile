import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:maraya_flutter/Screens/BrowseScreen.dart';
import 'package:maraya_flutter/Screens/HomeScreen.dart';
import 'package:maraya_flutter/Screens/ShopBrandsScreen.dart';
import '../../Utils/app_routes.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/string_utils.dart';
import '../../Utils/utils.dart';
import '../../Utils/views.dart';
import 'CartScreen.dart';

class BrandsScreen extends StatefulWidget {
  static const String route = "BrandsScreen";
  bool? show;
  BrandsScreen({Key? key,this.show}) : super(key: key);

  @override
  _BrandsScreenState createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {

  List<Map<String,dynamic>> categories = [];
  List<Map<String,dynamic>> sort = [];
  List<Map<String,dynamic>> filterlist = [];
  bool show = false;


  @override
  void initState() {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);

    categories =[
      {
        "title": "Armani",
        "color": ColorUtils.white,
      },
      {
        "title": "Aaizel",
        "color": ColorUtils.listColor,
      },
      {
        "title": "Aerin Beauty",
        "color": ColorUtils.listColor,
      },
      {
        "title": "Adidas",
        "color": ColorUtils.white,
      },
      {
        "title": "Age of Aquarius",
        "color": ColorUtils.white,
      },
      {
        "title": "Acne Studios",
        "color": ColorUtils.listColor,
      },
      {
        "title": "Adriana Degrease",
        "color": ColorUtils.listColor,
      },
      {
        "title": "Agua  by Agua Bendita",
        "color": ColorUtils.white,
      },
      {
        "title": "Alies",
        "color": ColorUtils.white,
      },
      {
        "title": "Ahlam Shahin",
        "color": ColorUtils.listColor,
      },
      {
        "title": "Babor",
        "color": ColorUtils.listColor,
      },
      {
        "title": "Balmain",
        "color": ColorUtils.white,
      },
      {
        "title": "BAOBAB",
        "color": ColorUtils.white,
      },
      {
        "title": "Baruni",
        "color": ColorUtils.listColor,
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('State: BrandsScreen');
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 15.w,
        title: Text(translate('strings.ExploreBrands')) ,
        titleTextStyle: TextStyle(color: ColorUtils.dividerColor ,
            fontFamily: FontUtils.almarenaBold , fontSize: 25.sp),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context, rootNavigator: true)
                  .pushReplacement(MaterialPageRoute(builder: (context) =>
                  HomeScreen(index: 3,)));
            },
            child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Image.asset(ImageUtils.cart_black,
                  scale: 1.7,)),
          ),
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
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: body()),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 180.w,
                // height: 60.h,
                child: EditText(
                  context: context,
                  hintText: "Search",
                  validator: validateEventName,
                  // controller: DateofBirthController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  // prefixIcon: ImageUtils.calendar,
                  suffixIcon: ImageUtils.search,
                  bordercolor: ColorUtils.white,
                  onSaved: (text) {
                    // DateOfBirth = text;
                  },
                  onChange: (text) {
                    // DateOfBirth = text;
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            physics:  NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0.w,
              mainAxisSpacing: 0.h,
              // childAspectRatio: 16/5,
              mainAxisExtent: 60.h,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return logsWidget(context, categories[index]);
            },
          ),
        ),
        SizedBox(height: 130.h,)

      ],
    );
  }


  Widget logsWidget(BuildContext context, Map<String,dynamic> category) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: false)
            .push(MaterialPageRoute(builder: (context) =>
            ShopBrandsScreen(),));
      },
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        height: 40.h,
        width: 160.w,
        decoration: BoxDecoration(
          color: category["color"],
        ),
        child: Center(
          child: SizedBox(
            width: 130.w,
            child: Text(
              category["title"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorUtils.dividerColor,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }
}