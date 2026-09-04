import 'package:flutter_project_practice/api_app/domain/entities/order_entities/itemsinfo_entity.dart';

abstract class OrderinfoEntity {
  final int orderId;
  final int userId;
  final List<ItemsinfoEntity>? items;
  final double totalPrice;
  final String shipped;

  OrderinfoEntity({
    required this.orderId,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.shipped,
  });
}
