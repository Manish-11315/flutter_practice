import 'package:bloc/bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_events.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_states.dart';

class Userbloc extends Bloc<UserblocEvents, UserblocStates>{
  Userbloc() : super(initialUserBloc()){
    on<loadsingleuser_event>(_onSingleUserHandler);
  }

  void _onSingleUserHandler(loadsingleuser_event event, Emitter<UserblocStates> emit ){

  }
}