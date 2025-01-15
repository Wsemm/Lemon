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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['storeId'] = this.storeId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['productType'] = this.productType;
    data['tags'] = this.tags;
    data['imageURL'] = this.imageURL;
    data['isPublished'] = this.isPublished;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;

    return data;
  }

  List<ProductsModel> productsModelFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductsModel.fromJson(json)).toList();
  }
}
