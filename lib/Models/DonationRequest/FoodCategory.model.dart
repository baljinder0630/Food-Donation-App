class FoodCategoryModel {
  String? name;
  String? quantity;
  String? imageURL;

  FoodCategoryModel({
    this.name,
    this.quantity,
    this.imageURL,
  });

  FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['quantity'] = quantity;
    data['imageURL'] = imageURL;
    return data;
  }

  FoodCategoryModel copyWith(
      {String? name, String? quantity, String? imageURL}) {
    return FoodCategoryModel(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      imageURL: imageURL ?? this.imageURL,
    );
  }
}
