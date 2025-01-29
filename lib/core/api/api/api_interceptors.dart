import 'dart:async';
import 'dart:io';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:lemon/core/api/api/retry_interceptors.dart';

import '../../cash/cache_helper.dart';
import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  // DioConnectivityRequestRetrier dioConnectivityRequestRetrier =
  // DioConnectivityRequestRetrier(connectivity: Connectivity(), dio: Dio());
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

  // @override
  // Future onError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (_shouldRetry(err)) {
  //     try {
  //       return dioConnectivityRequestRetrier
  //           .schedualRequestRetry(err.requestOptions);
  //     } catch (e) {
  //       return e;
  //     }
  //   }
  //   return err;
  // }

  // bool _shouldRetry(DioException err) {
  //   return err.type == DioExceptionType.unknown &&
  //       err.error != null &&
  //       err.error is SocketException;
  // }
}
