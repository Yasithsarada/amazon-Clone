// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amazon_clone/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final String? userId;
  final List<Rating>? rating;

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.userId,
    this.rating,
  });
  factory Product.fromMap(Map<String, dynamic> map) {
    //just another method
    return Product(
        name: map['name'] ?? '',
        description: map['description'],
        images: List<String>.from(map['images']),
        category: map['category'] ?? '',
        price: map['price']?.toDouble() ?? 0.0,
        id: map['_id'],
        userId: map['userId'],
        quantity: map['quantity']?.toDouble() ?? 0.0,
        rating: map['ratings'] != null
            ? List<Rating>.from(
                map['ratings']?.map(
                  (x) => Rating.fromMap(x),
                ),
              )
            : null);
  }
  Map<String, dynamic> toMap() {
    //just another method
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'UserId': userId,
      'rating': rating,
    };
  }

  String toJson() {
    //just another function
    // print("tooooooooooooooooooooooooo jssooooooooon");
    // print(Product);
    // print(json.encode(toMap()));
    return json.encode(
        toMap()); //calling the function *Product.toMap* within json.encode
    // there should be a map to convert json format , (thing should be provided is a map)..so that map will pass to the toMap method/function
    // the values within map will be added as value of the matching keys of *Map*(toMap's) such as name, description....
  }

  factory Product.fromJson(String source) {
    //just another function , function type is  *Product.fromJson*
    // print("11111111111111111111111111111111");
    // print(source);
    // print(Product.fromMap(json.decode(source)));
    return Product.fromMap(
        json.decode(source)); //calling the function *Product.fromMap*
    //within *Product.fromMap* function -> source will decode.
    //After decoding the JSON string, the result is Map and the resulting Map will have the key-value pairs
    // the result map's values will be added to the relevent Product variables such as name, description....
  }
}
