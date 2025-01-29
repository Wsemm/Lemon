
class UserAddressModel {
  int? id;
  int? userId;
  String? label;
  String? details;
  String? area;
  String? city;
  String? street;
  String? phoneNumber;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;

  UserAddressModel({this.id, this.userId, this.label, this.details, this.area, this.city, this.street, this.phoneNumber, this.isDefault, this.createdAt, this.updatedAt});

  UserAddressModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    label = json["label"];
    details = json["details"];
    area = json["area"];
    city = json["city"];
    street = json["street"];
    phoneNumber = json["phoneNumber"];
    isDefault = json["isDefault"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  static List<UserAddressModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserAddressModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["userId"] = userId;
    data["label"] = label;
    data["details"] = details;
    data["area"] = area;
    data["city"] = city;
    data["street"] = street;
    data["phoneNumber"] = phoneNumber;
    data["isDefault"] = isDefault;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    return data;
  }
}