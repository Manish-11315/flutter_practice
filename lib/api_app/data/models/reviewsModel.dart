import 'package:flutter_project_practice/api_app/domain/entities/ratingEntity.dart';

class Reviewsmodel extends Reviewsentity {
  final int userId;
  final int rating;
  final String comment;

  Reviewsmodel({
    required this.userId,
    required this.rating,
    required this.comment,
  }) : super(userId: userId, rating: rating, comment: comment);

  factory Reviewsmodel.fromJson(Map<String, dynamic> json) {
    return Reviewsmodel(
      userId: json["user_id"],
      rating: json["rating"],
      comment: json["comment"],
    );
  }
}
