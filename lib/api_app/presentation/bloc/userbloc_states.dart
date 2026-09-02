import 'package:flutter_project_practice/api_app/domain/entities/productsEntity.dart';

abstract class UserblocStates {}

class initialUserBloc extends UserblocStates{}

class loadingUserBloc extends UserblocStates{}

class errorUserBloc extends UserblocStates{
  final String errormsg;
  errorUserBloc({required this.errormsg});
}

class singleUserdataUserBloc extends UserblocStates{
  final ProductsEntity userentity;
  singleUserdataUserBloc({required this.userentity});
}

class listAllUserdataUserBloc extends UserblocStates{
  final List<ProductsEntity> userentity;
  listAllUserdataUserBloc({required this.userentity});
}