import 'package:flutter_project_practice/api_app/data/datasources/userDataSource.dart';
import 'package:flutter_project_practice/api_app/domain/entities/productsEntity.dart';
import 'package:flutter_project_practice/api_app/domain/repo/userRepo.dart';

class Userrepoimpl extends Userrepo{

  final Userdatasource userdatasourceobj;
  Userrepoimpl({required this.userdatasourceobj});

  @override
  Future<List<ProductsEntity>> fetchallusers() {
    return userdatasourceobj.getAllUsersData();
  }

  @override
  Future<ProductsEntity> getsingleUserdata({required int id}) {
    return userdatasourceobj.getSingleUserdata(id: id);
  }

}