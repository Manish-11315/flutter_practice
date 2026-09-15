class DataModel {
  final String id;
  final String name;
  final String email;
  final String creationTime;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.creationTime,
  });

  factory DataModel.toJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      creationTime: json["created_at"],
    );
  }

  Map<String, dynamic> toJson({
    required String id,
    required String name,
    required String email,
    required String creationTime,
  }) {
    return {
      "id": id,
      "name" : name,
      "email" : email,
      "created_at" : creationTime
    };
  }
}
