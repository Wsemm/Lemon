class SignUpModel {
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
  late String? message;
  late String? error;
  int? statusCode;
  SignUpModel(
      {this.message,
      this.error,
      this.statusCode,
      this.id,
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

  SignUpModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phoneNumber = json["phoneNumber"];
    email = json["email"];
    password = json["password"];
    city = json["city"];
    dob = json["dob"];
    tall = json["tall"];
    weight = json["weight"];
    gender = json["gender"];
    skinColor = json["skinColor"];
    skinType = json["skinType"] ?? [];
    hairColor = json["hairColor"];
    hairType = json["hairType"] ?? [];
    makeupFavColor = json["makeupFavColor"];
    chronicDiseases = json["chronicDiseases"];
    dailyNutritional = json["dailyNutritional"];
    verifiedAt = json["verifiedAt"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    message = json["message"];
    error = json["error"];
    statusCode = json["statusCode"];
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
    _data["message"] = message;
    _data["error"] = error;
    _data["statusCode"] = statusCode;

    return _data;
  }
}
