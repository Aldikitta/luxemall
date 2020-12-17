import 'dart:convert';
import 'package:http/http.dart' as http;

List<Post> profileFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.createPost(x)));

// String profileToJson(List<Post> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String id;
  String title;
  double price;
  String description;
  Category category;
  String image;

  Post({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory Post.createPost(Map<String, dynamic> object) {
    return Post(
      id: object["id"],
      title: object["title"],
      price: object["price"].toDouble(),
      description: object["description"],
      category: categoryValues.map[object["category"]],
      image: object["image"],
    );
  }

  static Future<List<Post>> connectToApi(int start, int limit) async {
    String apiUrl = "https://fakestoreapi.com/products?start=" +
        start.toString() +
        "&limit=" +
        limit.toString();

    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body) as List;

    return jsonObject
        .map<Post>(
          (item) => Post(
            id: item["id"].toString(),
            title: item["title"],
            price: item["price"].toDouble(),
            description: item["description"],
            category: categoryValues.map[item["category"]],
            image: item["image"],
          ),
        )
        .toList();
  }
}

enum Category { MEN_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men clothing": Category.MEN_CLOTHING,
  "women clothing": Category.WOMEN_CLOTHING
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
