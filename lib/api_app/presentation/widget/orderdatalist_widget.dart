import 'package:flutter/material.dart';
import 'package:flutter_project_practice/api_app/domain/entities/order_entities/orderinfo_entity.dart';
class OrderdatalistWidget extends StatelessWidget {
  final OrderinfoEntity orderinfoEntity;
  const OrderdatalistWidget({super.key, required this.orderinfoEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.redAccent
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order ID : ${orderinfoEntity.orderId}"),
              Text("userId : ${orderinfoEntity.userId}"),
              if(orderinfoEntity.items!.isNotEmpty)...[
                Text("Product Id => ${orderinfoEntity.items![0].productId}"),
                Text("Quantity => ${orderinfoEntity.items![0].quantity}"),
              ]
              else
                Text("No Order Data Available"),
              Text("Price : ${orderinfoEntity.totalPrice}"),
              Text("Status : ${orderinfoEntity.shipped}"),
      
            ],
          ),
        ),
      ),
    );
  }
}
