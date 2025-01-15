
class StoresModel {
  int? id;
  int? userId;
  String? brand;
  String? bio;
  String? avatarUrl;
  String? coverUrl;
  WorkHours? workHours;
  String? updatedAt;
  String? createdAt;
  String? deletedAt;

  StoresModel({this.id, this.userId, this.brand, this.bio, this.avatarUrl, this.coverUrl, this.workHours, this.updatedAt, this.createdAt, this.deletedAt});

  StoresModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    brand = json["brand"];
    bio = json["bio"];
    avatarUrl = json["avatarURL"];
    coverUrl = json["coverURL"];
    workHours = json["workHours"] == null ? null : WorkHours.fromJson(json["workHours"]);
    updatedAt = json["updatedAt"];
    createdAt = json["createdAt"];
    deletedAt = json["deletedAt"];
  }

  static List<StoresModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(StoresModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["userId"] = userId;
    _data["brand"] = brand;
    _data["bio"] = bio;
    _data["avatarURL"] = avatarUrl;
    _data["coverURL"] = coverUrl;
    if(workHours != null) {
      _data["workHours"] = workHours?.toJson();
    }
    _data["updatedAt"] = updatedAt;
    _data["createdAt"] = createdAt;
    _data["deletedAt"] = deletedAt;
    return _data;
  }
}

class WorkHours {
  WorkHours();

  WorkHours.fromJson(Map<String, dynamic> json) {

  }

  static List<WorkHours> fromList(List<Map<String, dynamic>> list) {
    return list.map(WorkHours.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    return _data;
  }
}