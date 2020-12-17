import 'dart:convert';
import 'package:http/http.dart' as http;

List<ApiModel> apiModelFromJson(String str) =>
    List<ApiModel>.from(json.decode(str).map((x) => ApiModel.fromJson(x)));

String apiModelToJson(List<ApiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiModel {
  ApiModel({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });

  int id;
  int userId;
  DateTime date;
  List<Product> products;
  int v;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "__v": v,
      };
  Future<List<ApiModel>> getDetail() async {
    final response = await http.get("https://fakestoreapi.com/carts");
    if (response.statusCode == 200) {
      return apiModelFromJson(response.body);
    } else {
      return null;
    }
  }
}

class Product {
  Product({
    this.productId,
    this.quantity,
  });

  int productId;
  int quantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
