import 'package:flutter_project_practice/api_app/domain/entities/order_entities/orderinfo_entity.dart';
import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';
import 'package:flutter_project_practice/api_app/domain/repo/userRepo.dart';
import 'package:injectable/injectable.dart';

@singleton
class FetchsingleuserUsecase {
  final Userrepo repoobj;
  FetchsingleuserUsecase({required this.repoobj});

  Future<List<OrderinfoEntity>> call({required int id}){
    return repoobj.getsingleOrderdata(id: id);
  }
}