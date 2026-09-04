import 'package:flutter_project_practice/api_app/data/models/products_model/reviewsModel.dart';
import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';

class productsModel extends ProductsEntity {
  final int productId;
  final String name;
  final String description;
  final double price;
  final String unit;
  final String imageUrl;
  final int discount;
  final bool availability;
  final String brandname;
  final String catrgories;
  final double rating;
  final List<Reviewsmodel> reviews;

  productsModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.discount,
    required this.availability,
    required this.brandname,
    required this.catrgories,
    required this.rating,
    required this.reviews,
  }) : super(
         productId: productId,
         name: name,
         description: description,
         price: price,
         unit: unit,
         imageUrl: imageUrl,
         discount: discount,
         availability: availability,
         brandname: brandname,
         catrgories: catrgories,
         rating: rating,
         reviews: reviews,
       );

  factory productsModel.fromJson(Map<String, dynamic> json) {
    return productsModel(
      productId: json["product_id"],
      name: json["name"],
      description: json["description"],
      price: (json["price"] as double).toDouble(),
      unit: json["unit"],
      imageUrl:  json["image"],
      discount: json["discount"],
      availability: json["availability"] == true,
      brandname: json["brand"],
      catrgories: json["category"],
      rating: (json["rating"] as double).toDouble(),
      reviews: json["reviews"] == null ? [] : (json["reviews"] as List).map((r) => Reviewsmodel.fromJson(r as Map<String, dynamic>)).toList()
    );
  }
}
