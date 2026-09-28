import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_practice/firebase_practice/core/exceptions/firebaseexceptions.dart';
import 'package:flutter_project_practice/firebase_practice/core/services/auth_service.dart';

class firebaseappDatasource {
  final AuthService authServiceinstance;
  firebaseappDatasource({required this.authServiceinstance});

  Future<UserCredential> userloginfun({required String email, required String password}) async{
    try{
      return await authServiceinstance.lginUser(email, password);
    }on FirebaseAuthException catch(firebaseexception){
      throw convertToFirebaseExceptions(firebaseexception);
    }catch (err){
      throw Exception("An Error Occurred");
    }
  }

  Future<UserCredential> userregisterfun({required String email, required String password}) async{
    return await authServiceinstance.registerUser(email, password);
  }

  Future<void> userlogout() async{
    return await authServiceinstance.logoutUser();
  }

  Future<void> usernamechange({required String newUsername}) async{
    return await authServiceinstance.changeUsername(newUsername);
  }

  Future<void> userupdatepassword({required String email, required String currentpassword, required String newpassword}) async{
    return await authServiceinstance.changeUserPassword(email, currentpassword, newpassword);
  }

  Future<void> useraccountdelete({required String email, required String password}) async {
    return await authServiceinstance.deleteUserAccount(email, password);
  }

}