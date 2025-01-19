class ProductsModel {
  int? id;
  int? storeId;
  String? name;
  String? description;
  int? price;
  int? stock;
  String? productType;
  List<String>? tags;
  String? imageURL;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;
  

  ProductsModel({
    this.id,
    this.storeId,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.productType,
    this.tags,
    this.imageURL,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    productType = json['productType'];
    tags = json['tags'].cast<String>();
    imageURL = json['imageURL'];
    isPublished = json['isPublished'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['storeId'] = storeId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['stock'] = stock;
    data['productType'] = productType;
    data['tags'] = tags;
    data['imageURL'] = imageURL;
    data['isPublished'] = isPublished;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }

  List<ProductsModel> productsModelFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductsModel.fromJson(json)).toList();
  }
}
