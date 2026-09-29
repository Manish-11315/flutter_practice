import 'package:bloc/bloc.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/changeusernameusecase.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/changeuserpassword.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/deleteuseraccountusecase.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/loginusecase.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/logoutusecase.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/registerusecase.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firestates.dart';

import 'fireevents.dart';

class Firebloc extends Bloc<fireEvents, fireStates> {
  final Loginusecase loginusecaseinstance;
  final Registerusecase registerusecaseinstance;
  final Deleteuseraccountusecase deleteuseraccountusecaseinstance;
  final Changeusernameusecase changeusernameusecaseinstance;
  final Changeuserpassword changeuserpasswordinstance;
  final Logoutusecase logoutusecaseinstance;

  Firebloc({
    required this.loginusecaseinstance,
    required this.registerusecaseinstance,
    required this.deleteuseraccountusecaseinstance,
    required this.changeusernameusecaseinstance,
    required this.changeuserpasswordinstance,
    required this.logoutusecaseinstance,
  }) : super(initialFireState()){
    on<loginUserEvent>(userloginEventHandler);
    on<registerUserEvent>(userregisterEventHandler);
    on<logoutUserEvent>(userlogoutEventHandler);
    on<updateUserPasswordEvent>(userpasswordUpdateEventHandler);
    on<updateUsernameEvent>(usernameUpdateEventHandler);
    on<deleteUserEvent>(userDeleteEventHandler);
  }

  void userloginEventHandler(loginUserEvent event, Emitter<fireStates> emit)async{
    emit(loadingFireState());
    try{
      final response = await loginusecaseinstance.call(email: event.email, password: event.password);
      emit(sucessFireState(userCredential: response));

    }catch(err){

    }
  }
  void userregisterEventHandler(registerUserEvent event, Emitter<fireStates> emit){

  }
  void userlogoutEventHandler(logoutUserEvent event, Emitter<fireStates> emit){

  }
  void userpasswordUpdateEventHandler(updateUserPasswordEvent event, Emitter<fireStates> emit){

  }
  void usernameUpdateEventHandler(updateUsernameEvent event, Emitter<fireStates> emit){

  }
  void userDeleteEventHandler(deleteUserEvent event, Emitter<fireStates> emit){

  }
}
