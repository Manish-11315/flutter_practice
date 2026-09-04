import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';
import 'package:flutter_project_practice/api_app/domain/repo/userRepo.dart';

class FetchallusersUsecase {
  final Userrepo userrepoobj;
  FetchallusersUsecase({required this.userrepoobj});

  Future<List<ProductsEntity>> call(){
    return userrepoobj.fetchallusers();
  }
}