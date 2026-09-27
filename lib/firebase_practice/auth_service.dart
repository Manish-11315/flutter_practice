import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseinstance = FirebaseAuth.instance;
  User? get currentUser => firebaseinstance.currentUser;
}