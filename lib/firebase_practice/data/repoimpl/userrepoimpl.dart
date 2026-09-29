import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_practice/firebase_practice/data/datasource/firebaseappdatasource.dart';
import 'package:flutter_project_practice/firebase_practice/domain/repository/userrepo.dart';

class Userrepoimpl extends UserRepo{
  final firebaseappDatasource firebasedatasourceinstance;
  Userrepoimpl({required this.firebasedatasourceinstance});

  @override
  Future<void> changeUserPassword({required String email, required String currentpassword, required String newpassword}) async{
    return await firebasedatasourceinstance.userupdatepassword(email: email, currentpassword: currentpassword, newpassword: newpassword);
  }

  @override
  Future<void> changeUsername({required String newusername})async {
    return await firebasedatasourceinstance.usernamechange(newUsername: newusername);
  }

  @override
  Future<void> deleteUserAccount({required String email, required String password})async {
    return await firebasedatasourceinstance.useraccountdelete(email: email, password: password);
  }

  @override
  Future<UserCredential> loginUser({required String email, required String password}) async {
    return await firebasedatasourceinstance.userloginfun(email: email, password: password);
  }

  @override
  Future<void> logoutUser() async{
    return await firebasedatasourceinstance.userlogout();
  }

  @override
  Future<UserCredential> registerUser({required String email, required String password})async {
    return await firebasedatasourceinstance.userregisterfun(email: email, password: password);
  }

}