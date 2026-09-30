import 'package:firebase_auth/firebase_auth.dart';

abstract class fireStates{}

class initialFireState extends fireStates{}

class loadingFireState extends fireStates{}

class sucessFireState extends fireStates{
  final UserCredential? userCredential;
  sucessFireState({this.userCredential});
}

class errorFireState extends fireStates{
  final String errormsg;
  errorFireState({required this.errormsg});
}