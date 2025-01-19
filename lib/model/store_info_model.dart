
class StoreInfoModel {
  int? id;
  int? userId;
  String? brand;
  String? bio;
  String? coverUrl;
  String? avatarUrl;
  WorkHours? workHours;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Products>? products;

  StoreInfoModel({this.id, this.userId, this.brand, this.bio, this.coverUrl, this.avatarUrl, this.workHours, this.createdAt, this.updatedAt, this.deletedAt, this.products});

  StoreInfoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    brand = json["brand"];
    bio = json["bio"];
    coverUrl = json["coverURL"];
    avatarUrl = json["avatarURL"];
    workHours = json["workHours"] == null ? null : WorkHours.fromJson(json["workHours"]);
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    deletedAt = json["deletedAt"];
    products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
  }

  static List<StoreInfoModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(StoreInfoModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["userId"] = userId;
    data["brand"] = brand;
    data["bio"] = bio;
    data["coverURL"] = coverUrl;
    data["avatarURL"] = avatarUrl;
    if(workHours != null) {
      data["workHours"] = workHours?.toJson();
    }
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["deletedAt"] = deletedAt;
    if(products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? storeId;
  String? name;
  String? description;
  int? price;
  int? stock;
  String? productType;
  ProductProperty? productProperty;
  List<String>? tags;
  String? imageUrl;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;

  Products({this.id, this.storeId, this.name, this.description, this.price, this.stock, this.productType, this.productProperty, this.tags, this.imageUrl, this.isPublished, this.createdAt, this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    storeId = json["storeId"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    stock = json["stock"];
    productType = json["productType"];
    productProperty = json["productProperty"] == null ? null : ProductProperty.fromJson(json["productProperty"]);
    tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    imageUrl = json["imageURL"];
    isPublished = json["isPublished"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  static List<Products> fromList(List<Map<String, dynamic>> list) {
    return list.map(Products.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["storeId"] = storeId;
    data["name"] = name;
    data["description"] = description;
    data["price"] = price;
    data["stock"] = stock;
    data["productType"] = productType;
    if(productProperty != null) {
      data["productProperty"] = productProperty?.toJson();
    }
    if(tags != null) {
      data["tags"] = tags;
    }
    data["imageURL"] = imageUrl;
    data["isPublished"] = isPublished;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    return data;
  }
}

class ProductProperty {
  ProductProperty();

  ProductProperty.fromJson(Map<String, dynamic> json);

  static List<ProductProperty> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductProperty.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class WorkHours {
  Fri? fri;
  Mon? mon;
  Sat? sat;
  Sun? sun;
  Tue? tue;
  Wed? wed;
  Thur? thur;

  WorkHours({this.fri, this.mon, this.sat, this.sun, this.tue, this.wed, this.thur});

  WorkHours.fromJson(Map<String, dynamic> json) {
    fri = json["fri"] == null ? null : Fri.fromJson(json["fri"]);
    mon = json["mon"] == null ? null : Mon.fromJson(json["mon"]);
    sat = json["sat"] == null ? null : Sat.fromJson(json["sat"]);
    sun = json["sun"] == null ? null : Sun.fromJson(json["sun"]);
    tue = json["tue"] == null ? null : Tue.fromJson(json["tue"]);
    wed = json["wed"] == null ? null : Wed.fromJson(json["wed"]);
    thur = json["thur"] == null ? null : Thur.fromJson(json["thur"]);
  }

  static List<WorkHours> fromList(List<Map<String, dynamic>> list) {
    return list.map(WorkHours.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(fri != null) {
      data["fri"] = fri?.toJson();
    }
    if(mon != null) {
      data["mon"] = mon?.toJson();
    }
    if(sat != null) {
      data["sat"] = sat?.toJson();
    }
    if(sun != null) {
      data["sun"] = sun?.toJson();
    }
    if(tue != null) {
      data["tue"] = tue?.toJson();
    }
    if(wed != null) {
      data["wed"] = wed?.toJson();
    }
    if(thur != null) {
      data["thur"] = thur?.toJson();
    }
    return data;
  }
}

class Thur {
  String? endTime;
  String? startTime;

  Thur({this.endTime, this.startTime});

  Thur.fromJson(Map<String, dynamic> json) {
    endTime = json["endTime"];
    startTime = json["startTime"];
  }

  static List<Thur> fromList(List<Map<String, dynamic>> list) {
    return list.map(Thur.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["endTime"] = endTime;
    data["startTime"] = startTime;
    return data;
  }
}

class Wed {
  String? endTime;
  String? startTime;

  Wed({this.endTime, this.startTime});

  Wed.fromJson(Map<String, dynamic> json) {
    endTime = json["endTime"];
    startTime = json["startTime"];
  }

  static List<Wed> fromList(List<Map<String, dynamic>> list) {
    return list.map(Wed.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["endTime"] = endTime;
    data["startTime"] = startTime;
    return data;
  }
}

class Tue {
  String? endTime;
  String? startTime;

  Tue({this.endTime, this.startTime});

  Tue.fromJson(Map<String, dynamic> json) {
    endTime = json["endTime"];
    startTime = json["startTime"];
  }

  static List<Tue> fromList(List<Map<String, dynamic>> list) {
    return list.map(Tue.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["endTime"] = endTime;
    data["startTime"] = startTime;
    return data;
  }
}

class Sun {
  String? endTime;
  String? startTime;

  Sun({this.endTime, this.startTime});

  Sun.fromJson(Map<String, dynamic> json) {
    endTime = json["endTime"];
    startTime = json["startTime"];
  }

  static List<Sun> fromList(List<Map<String, dynamic>> list) {
    return list.map(Sun.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["endTime"] = endTime;
    data["startTime"] = startTime;
    return data;
  }
}

class Sat {
  String? endTime;
  String? startTime;

  Sat({this.endTime, this.startTime});

  Sat.fromJson(Map<String, dynamic> json) {
    endTime = json["endTime"];
    startTime = json["startTime"];
  }

  static List<Sat> fromList(List<Map<String, dynamic>> list) {
    return list.map(Sat.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["endTime"] = endTime;
    data["startTime"] = startTime;
    return data;
  }
}

class Mon {
  String? endTime;
  String? startTime;

  Mon({this.endTime, this.startTime});

  Mon.fromJson(Map<String, dynamic> json) {
    endTime = json["endTime"];
    startTime = json["startTime"];
  }

  static List<Mon> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mon.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["endTime"] = endTime;
    data["startTime"] = startTime;
    return data;
  }
}

class Fri {
  String? endTime;
  String? startTime;

  Fri({this.endTime, this.startTime});

  Fri.fromJson(Map<String, dynamic> json) {
    endTime = json["endTime"];
    startTime = json["startTime"];
  }

  static List<Fri> fromList(List<Map<String, dynamic>> list) {
    return list.map(Fri.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["endTime"] = endTime;
    data["startTime"] = startTime;
    return data;
  }
}