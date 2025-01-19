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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["phoneNumber"] = phoneNumber;
    data["email"] = email;
    data["password"] = password;
    data["city"] = city;
    data["dob"] = dob;
    data["tall"] = tall;
    data["weight"] = weight;
    data["gender"] = gender;
    data["skinColor"] = skinColor;
    if (skinType != null) {
      data["skinType"] = skinType;
    }
    data["hairColor"] = hairColor;
    if (hairType != null) {
      data["hairType"] = hairType;
    }
    data["makeupFavColor"] = makeupFavColor;
    data["chronicDiseases"] = chronicDiseases;
    data["dailyNutritional"] = dailyNutritional;
    data["verifiedAt"] = verifiedAt;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["message"] = message;
    data["error"] = error;
    data["statusCode"] = statusCode;

    return data;
  }
}
