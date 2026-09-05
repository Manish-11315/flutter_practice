import 'package:flutter_project_practice/api_app/domain/entities/order_entities/orderinfo_entity.dart';
import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';

abstract class Userrepo {
  Future<List<ProductsEntity>> fetchallusers();
  Future<List<OrderinfoEntity>> getsingleOrderdata({required int id});
}