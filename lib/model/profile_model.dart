
class ProfileModel {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? password;
  String? city;
  String? dob;
  String? avatarUrl;
  PhysicalAttributes? physicalAttributes;
  dynamic verifiedAt;
  String? createdAt;
  String? updatedAt;

  ProfileModel({this.id, this.name, this.phoneNumber, this.email, this.password, this.city, this.dob, this.avatarUrl, this.physicalAttributes, this.verifiedAt, this.createdAt, this.updatedAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phoneNumber = json["phoneNumber"];
    email = json["email"];
    password = json["password"];
    city = json["city"];
    dob = json["dob"];
    avatarUrl = json["avatarURL"];
    physicalAttributes = json["physicalAttributes"] == null ? null : PhysicalAttributes.fromJson(json["physicalAttributes"]);
    verifiedAt = json["verifiedAt"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  static List<ProfileModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProfileModel.fromJson).toList();
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
    _data["avatarURL"] = avatarUrl;
    if(physicalAttributes != null) {
      _data["physicalAttributes"] = physicalAttributes?.toJson();
    }
    _data["verifiedAt"] = verifiedAt;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class PhysicalAttributes {
  String? gender;
  int? height;
  int? weight;
  String? hairType;
  String? skinType;
  String? hairColor;
  String? skinColor;
  String? makeupFavColor;
  String? chronicDiseases;
  DailyNutritional? dailyNutritional;

  PhysicalAttributes({this.gender, this.height, this.weight, this.hairType, this.skinType, this.hairColor, this.skinColor, this.makeupFavColor, this.chronicDiseases, this.dailyNutritional});

  PhysicalAttributes.fromJson(Map<String, dynamic> json) {
    gender = json["gender"];
    height = json["height"];
    weight = json["weight"];
    hairType = json["hairType"];
    skinType = json["skinType"];
    hairColor = json["hairColor"];
    skinColor = json["skinColor"];
    makeupFavColor = json["makeupFavColor"];
    chronicDiseases = json["chronicDiseases"];
    dailyNutritional = json["dailyNutritional"] == null ? null : DailyNutritional.fromJson(json["dailyNutritional"]);
  }

  static List<PhysicalAttributes> fromList(List<Map<String, dynamic>> list) {
    return list.map(PhysicalAttributes.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["gender"] = gender;
    _data["height"] = height;
    _data["weight"] = weight;
    _data["hairType"] = hairType;
    _data["skinType"] = skinType;
    _data["hairColor"] = hairColor;
    _data["skinColor"] = skinColor;
    _data["makeupFavColor"] = makeupFavColor;
    _data["chronicDiseases"] = chronicDiseases;
    if(dailyNutritional != null) {
      _data["dailyNutritional"] = dailyNutritional?.toJson();
    }
    return _data;
  }
}

class DailyNutritional {
  int? fat;
  int? carbs;
  int? protein;
  int? calories;

  DailyNutritional({this.fat, this.carbs, this.protein, this.calories});

  DailyNutritional.fromJson(Map<String, dynamic> json) {
    fat = json["fat"];
    carbs = json["carbs"];
    protein = json["protein"];
    calories = json["calories"];
  }

  static List<DailyNutritional> fromList(List<Map<String, dynamic>> list) {
    return list.map(DailyNutritional.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["fat"] = fat;
    _data["carbs"] = carbs;
    _data["protein"] = protein;
    _data["calories"] = calories;
    return _data;
  }
}