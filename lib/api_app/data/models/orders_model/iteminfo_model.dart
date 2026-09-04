import 'package:flutter_project_practice/api_app/domain/entities/order_entities/itemsinfo_entity.dart';

class IteminfoModel extends ItemsinfoEntity {
  final int productId;
  final int quantity;

  IteminfoModel({required this.productId, required this.quantity})
    : super(productId: productId, quantity: quantity);

  factory IteminfoModel.fromJson(Map<String, dynamic> json) {
    return IteminfoModel(
      productId: json["product_id"],
      quantity: json["quantity"],
    );
  }
}
