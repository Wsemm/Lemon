
class MyCartModel {
  String? message;
  int? statusCode;
  List<Data>? data;

  MyCartModel({this.message, this.statusCode, this.data});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusCode = json["statusCode"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  static List<MyCartModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MyCartModel.fromJson).toList();
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
  int? userId;
  int? storeId;
  int? totalAmount;
  List<CartItems>? cartItems;

  Data({this.id, this.userId, this.storeId, this.totalAmount, this.cartItems});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    storeId = json["storeId"];
    totalAmount = json["totalAmount"];
    cartItems = json["cartItems"] == null ? null : (json["cartItems"] as List).map((e) => CartItems.fromJson(e)).toList();
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["userId"] = userId;
    _data["storeId"] = storeId;
    _data["totalAmount"] = totalAmount;
    if(cartItems != null) {
      _data["cartItems"] = cartItems?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class CartItems {
  int? id;
  int? cartId;
  int? productId;
  String? productName;
  String? productImageUrl;
  int? price;
  int? quantity;

  CartItems({this.id, this.cartId, this.productId, this.productName, this.productImageUrl, this.price, this.quantity});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cartId = json["cartId"];
    productId = json["productId"];
    productName = json["productName"];
    productImageUrl = json["productImageURL"];
    price = json["price"];
    quantity = json["quantity"];
  }

  static List<CartItems> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItems.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["cartId"] = cartId;
    _data["productId"] = productId;
    _data["productName"] = productName;
    _data["productImageURL"] = productImageUrl;
    _data["price"] = price;
    _data["quantity"] = quantity;
    return _data;
  }
}