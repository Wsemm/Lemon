
class StoreCategories_model {
  String? message;
  int? statusCode;
  List<Data>? data;

  StoreCategories_model({this.message, this.statusCode, this.data});

  StoreCategories_model.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusCode = json["statusCode"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  static List<StoreCategories_model> fromList(List<Map<String, dynamic>> list) {
    return list.map(StoreCategories_model.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["statusCode"] = statusCode;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? iconPath;

  Data({this.id, this.name, this.iconPath});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    iconPath = json["iconPath"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["iconPath"] = iconPath;
    return _data;
  }
}