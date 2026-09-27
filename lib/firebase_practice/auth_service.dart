import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseinstance = FirebaseAuth.instance;
  User? get currentUser => firebaseinstance.currentUser;
  Stream<User?> get authStateChanges => firebaseinstance.authStateChanges();

  Future<UserCredential> register(String email, String password)async {
    return await firebaseinstance.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> login(String email, String password)async{
    return await firebaseinstance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout()async{
    return await firebaseinstance.signOut();
  }

  Future<void> resetpassword(String email) async{
    return await firebaseinstance.sendPasswordResetEmail(email: email);
  }

  Future<void> updateusername(String username) async{
    return await currentUser!.updateDisplayName(username);
  }

  Future<void> deleteuser(String email, String password) async{
    AuthCredential authCredentials = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(authCredentials);
    await currentUser!.delete();
    await firebaseinstance.signOut();
  }

}