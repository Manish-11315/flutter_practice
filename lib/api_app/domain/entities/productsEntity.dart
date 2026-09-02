import 'package:flutter_project_practice/api_app/domain/entities/ratingEntity.dart';

class ProductsEntity {
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
  final List<Reviewsentity> reviews;

  ProductsEntity({
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
    required this.reviews
  });
}
