class MyCartModel {
  String? message;
  int? statusCode;
  Data? data;

  MyCartModel({this.message, this.statusCode, this.data});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusCode = json["statusCode"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<MyCartModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MyCartModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["statusCode"] = statusCode;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? id;
  int? userId;
  List<CartItems>? cartItems;

  Data({this.id, this.userId, this.cartItems});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    cartItems = json["cartItems"] == null
        ? null
        : (json["cartItems"] as List)
            .map((e) => CartItems.fromJson(e))
            .toList();
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["userId"] = userId;
    if (cartItems != null) {
      _data["cartItems"] = cartItems?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class CartItems {
  int? id;
  int? cartId;
  int? productId;
  int? quantity;
  Product? product;

  CartItems(
      {this.id, this.cartId, this.productId, this.quantity, this.product});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cartId = json["cartId"];
    productId = json["productId"];
    quantity = json["quantity"];
    product =
        json["product"] == null ? null : Product.fromJson(json["product"]);
  }

  static List<CartItems> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItems.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["cartId"] = cartId;
    _data["productId"] = productId;
    _data["quantity"] = quantity;
    if (product != null) {
      _data["product"] = product?.toJson();
    }
    return _data;
  }

  void removeAt(int index) {}
}

class Product {
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

  Product(
      {this.id,
      this.storeId,
      this.name,
      this.description,
      this.price,
      this.stock,
      this.productType,
      this.productProperty,
      this.tags,
      this.imageUrl,
      this.isPublished,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    storeId = json["storeId"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    stock = json["stock"];
    productType = json["productType"];
    productProperty = json["productProperty"] == null
        ? null
        : ProductProperty.fromJson(json["productProperty"]);
    tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    imageUrl = json["imageURL"];
    isPublished = json["isPublished"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  static List<Product> fromList(List<Map<String, dynamic>> list) {
    return list.map(Product.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["storeId"] = storeId;
    _data["name"] = name;
    _data["description"] = description;
    _data["price"] = price;
    _data["stock"] = stock;
    _data["productType"] = productType;
    if (productProperty != null) {
      _data["productProperty"] = productProperty?.toJson();
    }
    if (tags != null) {
      _data["tags"] = tags;
    }
    _data["imageURL"] = imageUrl;
    _data["isPublished"] = isPublished;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class ProductProperty {
  ProductProperty();

  ProductProperty.fromJson(Map<String, dynamic> json) {}

  static List<ProductProperty> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductProperty.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    return _data;
  }
}
