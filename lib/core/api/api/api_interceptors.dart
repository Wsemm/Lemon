import 'package:dio/dio.dart';

import '../../cash/cache_helper.dart';
import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["accept-language"] = "en";
    options.headers[ApiKey.authorization] =
        CacheHelper().getData(key: ApiKey.accessToken) != null
            ? ' Bearer ${CacheHelper().getData(key: ApiKey.accessToken)}'
            : null;
    super.onRequest(options, handler);
  }
}
