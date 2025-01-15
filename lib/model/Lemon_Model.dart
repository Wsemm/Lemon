// class SignUp_Model {
//   late String? message;
//   late String? error;
//   int? statusCode;

//   SignUp_Model({ this.message,  this.error, this.statusCode});

//   SignUp_Model.fromJson(Map<String, dynamic> json) {
//     if (json["message"] is String) {
//       message = json["message"];
//     }
//     if (json["error"] is String) {
//       error = json["error"];
//     }
//     if (json["statusCode"] is int) {
//       statusCode = json["statusCode"];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["message"] = message;
//     _data["error"] = error;
//     _data["statusCode"] = statusCode;
//     return _data;
//   }
// }
