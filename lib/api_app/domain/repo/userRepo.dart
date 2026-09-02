import 'package:flutter_project_practice/api_app/domain/entities/productsEntity.dart';

abstract class Userrepo {
  Future<List<ProductsEntity>> fetchallusers();
  Future<ProductsEntity> getsingleUserdata({required int id});
}