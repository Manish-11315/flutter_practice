import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_practice/firebase_practice/domain/repository/userrepo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Logoutusecase {
  final UserRepo userRepoinstance;
  Logoutusecase({required this.userRepoinstance});

  Future<void> call() async{
    return await userRepoinstance.logoutUser();
  }
}