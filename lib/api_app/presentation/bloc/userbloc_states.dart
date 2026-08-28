import 'package:flutter_project_practice/api_app/domain/entities/userEntity.dart';

abstract class UserblocStates {}

class initialUserBloc extends UserblocStates{}

class loadingUserBloc extends UserblocStates{}

class errorUserBloc extends UserblocStates{
  final String errormsg;
  errorUserBloc({required this.errormsg});
}

class dataUserBloc extends UserblocStates{
  final Userentity userentity;
  dataUserBloc({required this.userentity});
}