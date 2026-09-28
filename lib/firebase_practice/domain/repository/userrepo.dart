import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepo{
  Future<UserCredential> loginUser({required String email, required String password});
  Future<UserCredential> registerUser({required String email, required String password});
  Future<void> logoutUser();
  Future<void> changeUserPassword({required String email, required String currentpassword, required String newpassword});
  Future<void> deleteUserAccount({required String email, required String password});
  Future<void> changeUsername({required String newusername});
}