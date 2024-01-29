class FoodCategory {
  String? name;
  String? quantity;

  FoodCategory({this.name, this.quantity});

  FoodCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['quantity'] = quantity;
    return data;
  }
}
