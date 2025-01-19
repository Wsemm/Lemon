import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routs.dart';
import '../cash/cache_helper.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    //  if (CacheHelper().getDataString(key: "step") == "0") {
    //   return const RouteSettings(name: AppRout.signUP);
    // }
    if (CacheHelper().getDataString(key: "step") == "1") {
      return const RouteSettings(name: AppRout.signUP);
    }
    if (CacheHelper().getDataString(key: "step") == "2") {
      return const RouteSettings(name: AppRout.profileInfo);
    }
    if (CacheHelper().getDataString(key: "step") == "3" || CacheHelper().getDataString(key: "step") == "4") {
      return const RouteSettings(name: AppRout.homeScreen);
    }
    return null;
  }
}
