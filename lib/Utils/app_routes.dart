import 'package:flutter/cupertino.dart';
import 'package:maraya_flutter/Screens/BrowseScreen.dart';
import 'package:maraya_flutter/Screens/GeneralScreen.dart';
import 'package:maraya_flutter/Screens/RegisterScreen.dart';
import '../Screens/HomeScreen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/SplashScreen.dart';
import '../Screens/VerficationScreen.dart';
import 'App_Screen_Transition.dart';

class AppRoutes{
  static const Splash = '/splash-screen';
  static const Login = '/login-screen';
  static const Register = '/register-screen';
  static const Verfication = '/verification-screen';
  static const General = '/general-screen';
  static const Home = '/home-screen';
  static const Dashboard = '/dashboard-screen';
  static const Brand = '/brand-screen';
  static const Category = '/category-screen';
  static const Cart = '/cart-screen';
  static const Browse = '/browse-screen';

  static Route<dynamic> getRoute(RouteSettings settings) {
    late Map<String, Object?> map;
    if (settings.arguments != null) {
      map = settings.arguments as Map<String, Object?>;
    }

    switch (settings.name) {
      case '/':
        return AppScreenTransition.setTransition(SplashScreen());
        break;

      case Splash:
        return AppScreenTransition.setTransition(SplashScreen());
        break;

      case Login:
        return AppScreenTransition.setTransition(LoginScreen());
        break;

      case Register:
        return AppScreenTransition.setTransition(RegisterScreen());
        break;

      case Verfication:
        return AppScreenTransition.setTransition(VerificationScreen());
        break;

      case General:
        return AppScreenTransition.setTransition(GeneralScreen());
        break;

      case Home:
        return AppScreenTransition.setTransition(HomeScreen());
        break;

      case Dashboard:
        return AppScreenTransition.setTransition(HomeScreen());
        break;

      case Brand:
        return AppScreenTransition.setTransition(HomeScreen());
        break;

      case Category:
        return AppScreenTransition.setTransition(HomeScreen());
        break;

      case Cart:
        return AppScreenTransition.setTransition(HomeScreen());
        break;

      case Browse:
        return AppScreenTransition.setTransition(BrowseScreen());
        break;

      default:
        return AppScreenTransition.setTransition(SplashScreen());
    }
  }
}



