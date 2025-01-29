// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';

// class DioConnectivityRequestRetrier extends Interceptor {
//   final Dio dio;
//   final Connectivity connectivity;

//   DioConnectivityRequestRetrier(
//       {required this.dio, required this.connectivity});

//   Future<Response?> schedualRequestRetry(RequestOptions requestOptions) async {
//     StreamSubscription? streamSubscription;
//     final responseComplitor = Completer<Response>();

//     streamSubscription =
//         connectivity.onConnectivityChanged.listen((connectivityResult) {
//       print("dsadsaaaaaaaaaaaaaaaaa");
//       if (connectivityResult != ConnectivityResult.none) {
//         streamSubscription!.cancel();
//         responseComplitor.complete(dio.request(
//           requestOptions.path,
//           cancelToken: requestOptions.data,
//           onReceiveProgress: requestOptions.onReceiveProgress,
//           onSendProgress: requestOptions.onSendProgress,
//           queryParameters: requestOptions.queryParameters,
//         ));
//       }
//     });
//     responseComplitor.future;
//   }
// }
