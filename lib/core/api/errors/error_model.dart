import '../api/end_points.dart';

class ErrorModel {
  final int status;
  var message;
  String? error;

  // final String error;

  ErrorModel({
    required this.status,
    required this.message,
    this.error,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.statusCode],
      message: jsonData[ApiKey.message],
      error: jsonData[ApiKey.error],
    );
  }
}
