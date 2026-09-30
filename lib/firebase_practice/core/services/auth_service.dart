import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth firebaseinstance = FirebaseAuth.instance;
  User? get currentUser => firebaseinstance.currentUser;
  Stream<User?> get authStateChanges => firebaseinstance.authStateChanges();

  Future<UserCredential> registerUser(String email, String password) async{
    return await firebaseinstance.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> lginUser(String email, String password) async{
    return await firebaseinstance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> changeUsername(String newusername) async{
    return await currentUser!.updateDisplayName(newusername);
  }

  Future<void> logoutUser() async{
    return await firebaseinstance.signOut();
  }

  Future<void> deleteUserAccount(String email, String password) async{
    AuthCredential authCredential = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(authCredential);
    await currentUser!.delete();
    await firebaseinstance.signOut();
  }

  Future<void> changeUserPassword(String email, String currentpassword, String newpassword) async{
    AuthCredential authCredential = EmailAuthProvider.credential(email: email, password: currentpassword);
    await currentUser!.reauthenticateWithCredential(authCredential);
    await currentUser!.updatePassword(newpassword);

  }
}