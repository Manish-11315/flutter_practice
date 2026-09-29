import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_practice/firebase_practice/data/datasource/firebaseappdatasource.dart';
import 'package:flutter_project_practice/firebase_practice/domain/repository/userrepo.dart';

class Userrepoimpl extends UserRepo{
  final firebaseappDatasource firebasedatasourceinstance;
  Userrepoimpl({required this.firebasedatasourceinstance});

  @override
  Future<void> changeUserPassword({required String email, required String currentpassword, required String newpassword}) {
    return firebasedatasourceinstance.userupdatepassword(email: email, currentpassword: currentpassword, newpassword: newpassword);
  }

  @override
  Future<void> changeUsername({required String newusername}) {
    return firebasedatasourceinstance.usernamechange(newUsername: newusername);
  }

  @override
  Future<void> deleteUserAccount({required String email, required String password}) {
    return firebasedatasourceinstance.useraccountdelete(email: email, password: password);
  }

  @override
  Future<UserCredential> loginUser({required String email, required String password}) {
    return firebasedatasourceinstance.userloginfun(email: email, password: password);
  }

  @override
  Future<void> logoutUser() {
    return firebasedatasourceinstance.userlogout();
  }

  @override
  Future<UserCredential> registerUser({required String email, required String password}) {
    return firebasedatasourceinstance.userregisterfun(email: email, password: password);
  }

}