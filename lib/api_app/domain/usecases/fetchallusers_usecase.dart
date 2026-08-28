import 'package:flutter_project_practice/api_app/domain/entities/userEntity.dart';
import 'package:flutter_project_practice/api_app/domain/repo/userRepo.dart';

class FetchallusersUsecase {
  final Userrepo userrepoobj;
  FetchallusersUsecase({required this.userrepoobj});

  Future<List<Userentity>> call(){
    return userrepoobj.fetchallusers();
  }
}