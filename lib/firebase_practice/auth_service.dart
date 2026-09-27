import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseinstance = FirebaseAuth.instance;
  User? get currentUser => firebaseinstance.currentUser;
  Stream<User?> get authStateChanges => firebaseinstance.authStateChanges();

  Future<UserCredential> register(String email, String password){
    return firebaseinstance.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> login(String email, String password)async{
    return await firebaseinstance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout()async{
    return await firebaseinstance.signOut();
  }

}