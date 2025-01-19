
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["userId"] = userId;
    data["brand"] = brand;
    data["bio"] = bio;
    data["avatarURL"] = avatarUrl;
    data["coverURL"] = coverUrl;
    if(workHours != null) {
      data["workHours"] = workHours?.toJson();
    }
    data["updatedAt"] = updatedAt;
    data["createdAt"] = createdAt;
    data["deletedAt"] = deletedAt;
    return data;
  }
}

class WorkHours {
  WorkHours();

  WorkHours.fromJson(Map<String, dynamic> json);

  static List<WorkHours> fromList(List<Map<String, dynamic>> list) {
    return list.map(WorkHours.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}