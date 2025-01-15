import 'package:get/get.dart';
import 'package:lemon/view/screens/Auth/login.dart';
import 'package:lemon/view/screens/Auth/verifyEmail.dart';
import 'package:lemon/view/screens/Orders/orders.dart';
import 'package:lemon/view/screens/Products/Product_details.dart';
import 'package:lemon/view/screens/Stores/Store_Profile.dart';
import 'package:lemon/view/screens/Stores/Stores.dart';
import 'package:lemon/view/screens/cart/cart.dart';
import 'package:lemon/view/screens/home/homePage.dart';
import 'package:lemon/view/screens/home/home_screen.dart';
import 'package:lemon/view/screens/onBoarding.dart';
import 'package:lemon/view/screens/Auth/signUp.dart';
import 'package:lemon/view/screens/User_Info/personal_Info.dart';
import 'package:lemon/view/screens/splashScreen.dart';
import 'package:lemon/view/screens/test.dart';
import 'package:lemon/view/screens/user_Profile.dart';

import 'core/middleware/MyMiddleWare.dart';
import 'view/screens/Auth/forgetPassword.dart';
import 'view/screens/User_Info/physical_Info.dart';
import 'view/screens/categories/homeMade.dart';
import 'view/screens/search.dart';

class AppRout {
  static const String onBoading = "/onBoading";
  static const String login = "/login";
  static const String signUP = "/SignUP";
  static const String chatbot = "/Chatbot";
  static const String verifyEmail = "/verifyEmail";
  static const String homePage = "/homePage";
  static const String splashScreen = "/SplashScreen";
  static const String profileInfo = "/ProfileInfo";
  static const String forgetPassword = "/ForgetPassword";
  static const String homeScreen = "/homeScreen";
  static const String productDetails = "/ProductDetails";
  static const String homeMade = "/HomeMade";
  static const String stores = "/Stores";
  static const String userProfile = "/UserProfile";
  static const String storeProfile = "/StoreProfile";
  static const String search = "/Search";
  static const String test = "/test";
  static const String cart = "/cart";
  static const String orders = "/orders";
}

// CacheHelper().getDataString(key: "step")!=1? AppRout.homePage :
List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => SplashScreen()),
  GetPage(
      name: AppRout.splashScreen,
      page: () => SignUP(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRout.onBoading, page: () => const onBoarding()),
  GetPage(name: AppRout.login, page: () => const Login()),
  GetPage(name: AppRout.signUP, page: () => const SignUP()),
  GetPage(name: AppRout.chatbot, page: () => physicalInfo()),
  GetPage(name: AppRout.verifyEmail, page: () => verifyEmail()),
  GetPage(name: AppRout.homePage, page: () => homePage()),
  GetPage(name: AppRout.profileInfo, page: () => PersonalInfo()),
  GetPage(name: AppRout.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRout.homeScreen, page: () => HomeScreen()),
  GetPage(name: AppRout.productDetails, page: () => ProductDetails()),
  GetPage(name: AppRout.homeMade, page: () => HomeMade()),
  GetPage(name: AppRout.stores, page: () => Stores()),
  GetPage(name: AppRout.userProfile, page: () => UserProfile()),
  GetPage(name: AppRout.storeProfile, page: () => StoreProfile()),
  GetPage(name: AppRout.search, page: () => Search()),
  GetPage(name: AppRout.test, page: () => test()),
  GetPage(name: AppRout.cart, page: () => Cart()),
  GetPage(name: AppRout.orders, page: () => Orders()),
];
