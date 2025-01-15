class LoginModel {
  User? user;
  String? accessToken;
  String? refreshToken;

  LoginModel({this.user, this.accessToken, this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["accessToken"] is String) {
      accessToken = json["accessToken"];
    }
    if (json["refreshToken"] is String) {
      refreshToken = json["refreshToken"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["accessToken"] = accessToken;
    _data["refreshToken"] = refreshToken;
    return _data;
  }
}

class User {
  int? id;
  dynamic name;
  dynamic phoneNumber;
  String? email;
  String? password;
  dynamic city;
  dynamic dob;
  dynamic tall;
  dynamic weight;
  dynamic gender;
  dynamic skinColor;
  List<dynamic>? skinType;
  dynamic hairColor;
  List<dynamic>? hairType;
  dynamic makeupFavColor;
  dynamic chronicDiseases;
  dynamic dailyNutritional;
  dynamic verifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.password,
      this.city,
      this.dob,
      this.tall,
      this.weight,
      this.gender,
      this.skinColor,
      this.skinType,
      this.hairColor,
      this.hairType,
      this.makeupFavColor,
      this.chronicDiseases,
      this.dailyNutritional,
      this.verifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    name = json["name"];
    phoneNumber = json["phoneNumber"];
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    city = json["city"];
    dob = json["dob"];
    tall = json["tall"];
    weight = json["weight"];
    gender = json["gender"];
    skinColor = json["skinColor"];
    if (json["skinType"] is List) {
      skinType = json["skinType"] ?? [];
    }
    hairColor = json["hairColor"];
    if (json["hairType"] is List) {
      hairType = json["hairType"] ?? [];
    }
    makeupFavColor = json["makeupFavColor"];
    chronicDiseases = json["chronicDiseases"];
    dailyNutritional = json["dailyNutritional"];
    verifiedAt = json["verifiedAt"];
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["phoneNumber"] = phoneNumber;
    _data["email"] = email;
    _data["password"] = password;
    _data["city"] = city;
    _data["dob"] = dob;
    _data["tall"] = tall;
    _data["weight"] = weight;
    _data["gender"] = gender;
    _data["skinColor"] = skinColor;
    if (skinType != null) {
      _data["skinType"] = skinType;
    }
    _data["hairColor"] = hairColor;
    if (hairType != null) {
      _data["hairType"] = hairType;
    }
    _data["makeupFavColor"] = makeupFavColor;
    _data["chronicDiseases"] = chronicDiseases;
    _data["dailyNutritional"] = dailyNutritional;
    _data["verifiedAt"] = verifiedAt;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}
