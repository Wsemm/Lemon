import 'package:get/get_utils/src/get_utils/get_utils.dart';

validator(String val, int min, max, String type, String PasswordReset) {
  if (val.isEmpty) {
    return "the value can't be Empety";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not vaild username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not vaild email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not vaild phone";
    }
  }

  if (type == "password") {
    if (val.length < 8) {
      return "the value length must be $min or more";
    }
  }
  if (type == "PasswordReset") {
    if (val.length < 8) return "the value length must be $min or more";

    if (val != PasswordReset) {
      return "you entred diffrent password";
    }
  }

  if (val.length < min) {
    return "the value length must be $min or more";
  }
  if (val.length > max) {
    return "the value can't be more than $max";
  }
}

validatorEmptyAllow(
    String val, int min, max, String type, String PasswordReset) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not vaild username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not vaild email";
    }
  }

  if (type == "phone") {
    if (val.isNotEmpty) {
      if (!GetUtils.isPhoneNumber(val)) {
        return "phone Number can't be less thatn $max";
      }
    }
  }

  if (type == "password") {
    if (val.length < 8) {
      return "the value length must be $min or more";
    }
  }
  if (type == "PasswordReset") {
    if (val.length < 8) return "the value length must be $min or more";

    if (val != PasswordReset) {
      return "you entred diffrent password";
    }
  }

  if (val.length < min) {
    return "the value length must be $min or more";
  }
  if (val.length > max) {
    return "the value can't be more than $max";
  }
}
