import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';
import 'package:flutter_project_practice/api_app/domain/repo/userRepo.dart';

class FetchsingleuserUsecase {
  final Userrepo repoobj;
  FetchsingleuserUsecase({required this.repoobj});

  Future<ProductsEntity> call({required int id}){
    return repoobj.getsingleUserdata(id: id);
  }
}