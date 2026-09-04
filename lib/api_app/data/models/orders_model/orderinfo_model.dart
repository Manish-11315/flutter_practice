import 'package:flutter_project_practice/api_app/data/models/orders_model/iteminfo_model.dart';
import 'package:flutter_project_practice/api_app/domain/entities/order_entities/orderinfo_entity.dart';

class OrderinfoModel extends OrderinfoEntity {
  final int orderId;
  final int userId;
  final List<IteminfoModel>? items;
  final double totalPrice;
  final String shipped;

  OrderinfoModel({
    required this.orderId,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.shipped,
  }) : super(
         orderId: orderId,
         userId: userId,
         items: items,
         totalPrice: totalPrice,
         shipped: shipped,
       );

  factory OrderinfoModel.fromJson(Map<String, dynamic> json) {
    return OrderinfoModel(
      orderId: json["order_id"],
      userId: json["user_id"],
      items: json["items"] == null ? json["No Data Found"] : (json["items"] as List).map((element) => IteminfoModel.fromJson(element)).toList(),
      totalPrice: (json["total_price"] as double).toDouble(),
      shipped: json["status"],
    );
  }
}
