import 'package:flutter_project_practice/api_app/domain/entities/order_entities/orderinfo_entity.dart';
import 'package:flutter_project_practice/api_app/domain/entities/post_api_entities/post_api_order.dart';
import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';

abstract class Userrepo {
  Future<List<ProductsEntity>> fetchallusers();

  Future<List<OrderinfoEntity>> getsingleOrderdata({required int id});

  Future<PostApiOrderEntity> postOrderData({
    required String id,
    required String name,
    required String email,
    required String created_at,
  });
}
