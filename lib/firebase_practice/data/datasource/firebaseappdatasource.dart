import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project_practice/firebase_practice/core/exceptions/firebaseexceptions.dart';
import 'package:flutter_project_practice/firebase_practice/core/services/auth_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class firebaseappDatasource {
  final AuthService authServiceinstance;
  firebaseappDatasource({required this.authServiceinstance});

  Future<UserCredential> userloginfun({required String email, required String password}) async{
    try{
      return await authServiceinstance.lginUser(email, password);
    }on FirebaseAuthException catch(firebaseexception){
      throw convertToFirebaseExceptions(firebaseexception);
    }catch (err){
      throw Exception("An Error Occurred : ${err.toString()}");
    }
  }

  Future<UserCredential> userregisterfun({required String email, required String password}) async{
    try{
      return await authServiceinstance.registerUser(email, password);
    }on FirebaseAuthException catch(firebaseexception){
      throw convertToFirebaseExceptions(firebaseexception);
    }catch(err){
      throw Exception("An Error Occurred : ${err.toString()}");
    }
  }

  Future<void> userlogout() async{
    try{
      return await authServiceinstance.logoutUser();
    }on FirebaseAuthException catch(firebaseexception){
      throw convertToFirebaseExceptions(firebaseexception);
    }catch(err){
      throw Exception("An Error Occurred : ${err.toString()}");
    }
  }

  Future<void> usernamechange({required String newUsername}) async{
    try{
      return await authServiceinstance.changeUsername(newUsername);
    }on FirebaseAuthException catch (firebaseexception){
      throw convertToFirebaseExceptions(firebaseexception);
    }catch(err){
      throw Exception("An Error Occurred : ${err.toString()}");
    }
  }

  Future<void> userupdatepassword({required String email, required String currentpassword, required String newpassword}) async{
    try{
      return await authServiceinstance.changeUserPassword(
          email, currentpassword, newpassword);
    }on FirebaseAuthException catch(firebaseexception){
      throw convertToFirebaseExceptions(firebaseexception);
    }catch(err){
      throw Exception("An Error Occurred : ${err.toString()}");
    }
  }

  Future<void> useraccountdelete({required String email, required String password}) async {
    try{
      return await authServiceinstance.deleteUserAccount(email, password);
    }on FirebaseAuthException catch(firebaseexception){
      throw convertToFirebaseExceptions(firebaseexception);
    }catch(err){
      throw Exception("An Error Occurred : ${err.toString()}");
    }
  }

}