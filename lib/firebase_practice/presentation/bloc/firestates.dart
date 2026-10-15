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

class logoutSuccessState extends fireStates{}

class logoutErrorState extends fireStates{
  final String errormessage;
  logoutErrorState({required this.errormessage});
}

class logoutLoadingState extends fireStates{}

class changepasswordLoadingState extends fireStates{}

class changepasswordSucessState extends fireStates{}

class changepasswordErrorState extends fireStates{
  final String errormessage;
  changepasswordErrorState({required this.errormessage});
}