import 'package:flutter/material.dart';
import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';
class UsersdatalistWidget extends StatelessWidget {
  final ProductsEntity products;
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
            Text("Product ID : ${products.productId}"),
            Text("Name : ${products.name}"),
            Text("Description : ${products.description}"),
            Text("Price : ${products.price}"),
            Text("Unit : ${products.unit}"),
            Text("ImageUrl : ${products.imageUrl}"),
            Text("Discount : ${products.discount}"),
            Text("Availability : ${products.availability}"),
            Text("Brandname : ${products.brandname}"),
            Text("Categories : ${products.catrgories}"),
            Text("Rating : ${products.rating}"),
            if(products.reviews.isNotEmpty) ...[
              Text("Reviews => User_id: ${products.reviews[0].userId}"),
              Text("Reviews => Rating: ${products.reviews[0].rating}"),
              Text("Reviews => Comment: ${products.reviews[0].comment}")
            ]else
              Text("No reviews yet")

          ],
        ),
      ),
    );
  }
}
