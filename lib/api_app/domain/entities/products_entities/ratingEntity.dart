abstract class Reviewsentity {
  final int userId;
  final int rating;
  final String comment;

  Reviewsentity({
    required this.userId,
    required this.rating,
    required this.comment
  });
}