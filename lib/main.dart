import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:oktoast/oktoast.dart';

import 'Screens/SplashScreen.dart';
import 'Utils/App_Screen_Transition.dart';
import 'Utils/app_routes.dart';
import 'Utils/app_theme.dart';
import 'Utils/color_utils.dart';
import 'Utils/utils.dart';

Future<void> main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      supportedLocales: ['en', 'ar']);

  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppScreenTransition appScreenTransition= AppScreenTransition();
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: LayoutBuilder(
          builder: (context, constraints) {
            return MediaQuery(
              data: MediaQueryData(textScaleFactor: 1.0),
              child: OKToast(
                  position: ToastPosition.bottom,
                  child: WillPopScope(
                      onWillPop: appScreenTransition.onWillPop,
                      child: ScreenUtilInit(
                          builder: (context, child) => MaterialApp(
                            builder: EasyLoading.init(),
                            color: ColorUtils.black,
                            title: 'Maraya',
                            theme: AppTheme.themeData,
                            localizationsDelegates: [
                              GlobalMaterialLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              localizationDelegate
                            ],
                            supportedLocales: localizationDelegate.supportedLocales,
                            locale: localizationDelegate.currentLocale,
                            debugShowCheckedModeBanner: false,
                            onGenerateRoute: AppRoutes.getRoute,
                            // navigatorKey: navigatorKey,
                            navigatorKey: GlobalVariable.navState,
                            home: SplashScreen(),
                            onUnknownRoute: (settings) {
                              return MaterialPageRoute(
                                builder: (context) => SplashScreen(),
                              );
                            },
                          )
                      ))),
            );
          }
      ),
    );
  }
}
