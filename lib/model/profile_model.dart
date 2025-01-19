
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["phoneNumber"] = phoneNumber;
    data["email"] = email;
    data["password"] = password;
    data["city"] = city;
    data["dob"] = dob;
    data["avatarURL"] = avatarUrl;
    if(physicalAttributes != null) {
      data["physicalAttributes"] = physicalAttributes?.toJson();
    }
    data["verifiedAt"] = verifiedAt;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["gender"] = gender;
    data["height"] = height;
    data["weight"] = weight;
    data["hairType"] = hairType;
    data["skinType"] = skinType;
    data["hairColor"] = hairColor;
    data["skinColor"] = skinColor;
    data["makeupFavColor"] = makeupFavColor;
    data["chronicDiseases"] = chronicDiseases;
    if(dailyNutritional != null) {
      data["dailyNutritional"] = dailyNutritional?.toJson();
    }
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["fat"] = fat;
    data["carbs"] = carbs;
    data["protein"] = protein;
    data["calories"] = calories;
    return data;
  }
}