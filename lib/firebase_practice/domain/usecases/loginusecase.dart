import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_practice/firebase_practice/domain/repository/userrepo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Loginusecase {
  final UserRepo userRepoinstance;
  Loginusecase({required this.userRepoinstance});

  Future<UserCredential> call({required String email, required String password}) async{
    return await userRepoinstance.loginUser(email: email, password: password);
  }
}