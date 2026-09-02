import 'package:flutter/material.dart';
import 'package:flutter_project_practice/api_app/domain/entities/productsEntity.dart';
class UsersdatalistWidget extends StatelessWidget {
  final List<ProductsEntity> products;
  const UsersdatalistWidget({super.key , required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.redAccent
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product ID : ${products[0].productId}"),
            Text("Name : ${products[0].name}"),
            Text("Description : ${products[0].description}"),
            Text("Price : ${products[0].price}"),
            Text("Unit : ${products[0].unit}"),
            Text("ImageUrl : ${products[0].imageUrl}"),
            Text("Discount : ${products[0].discount}"),
            Text("Availability : ${products[0].availability}"),
            Text("Brandname : ${products[0].brandname}"),
            Text("Categories : ${products[0].catrgories}"),
            Text("Rating : ${products[0].rating}"),
            Text("Reviews => User_id: ${products[0].reviews[0].userId}"),
            Text("Reviews => Rating: ${products[0].reviews[0].rating}"),
            Text("Reviews => Comment: ${products[0].reviews[0].comment}"),
          ],
        ),
      ),
    );
  }
}
