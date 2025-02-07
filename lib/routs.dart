import 'package:get/get.dart';
import 'package:lemon/view/screens/Auth/login.dart';
import 'package:lemon/view/screens/Auth/verifyEmail.dart';
import 'package:lemon/view/screens/Orders/orders.dart';
import 'package:lemon/view/screens/Products/Product_details.dart';
import 'package:lemon/view/screens/Stores/Store_Profile.dart';
import 'package:lemon/view/screens/Stores/Stores.dart';
import 'package:lemon/view/screens/cart/CartStoreProducts.dart';
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
  static const String cartStoreProducts = "/cartStoreProducts";
}

// CacheHelper().getDataString(key: "step")!=1? AppRout.homePage :
List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => const SplashScreen()),
  GetPage(
      name: AppRout.splashScreen,
      page: () => const SignUP(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRout.onBoading, page: () => const onBoarding()),
  GetPage(name: AppRout.login, page: () => const Login()),
  GetPage(name: AppRout.signUP, page: () => const SignUP()),
  GetPage(name: AppRout.chatbot, page: () => const physicalInfo()),
  GetPage(name: AppRout.verifyEmail, page: () => const verifyEmail()),
  GetPage(name: AppRout.homePage, page: () => const homePage()),
  GetPage(name: AppRout.profileInfo, page: () => const PersonalInfo()),
  GetPage(name: AppRout.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRout.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRout.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRout.homeMade, page: () => const HomeMade()),
  GetPage(name: AppRout.stores, page: () => const Stores()),
  GetPage(name: AppRout.userProfile, page: () => const UserProfile()),
  GetPage(name: AppRout.storeProfile, page: () => const StoreProfile()),
  GetPage(name: AppRout.search, page: () => const Search()),
  GetPage(name: AppRout.test, page: () => const test()),
  GetPage(name: AppRout.cart, page: () => const Cart()),
  GetPage(name: AppRout.orders, page: () => const Orders()),
  GetPage(name: AppRout.cartStoreProducts, page: () => const CartStoreProducts()),
];
