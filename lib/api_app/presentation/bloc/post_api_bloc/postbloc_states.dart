import 'package:flutter_project_practice/api_app/domain/entities/post_api_entities/post_api_order.dart';

abstract class  PostblocStates {}

class initialpostState extends PostblocStates{}

class loadingpostState extends PostblocStates{}

class successpostState extends PostblocStates{
  final PostApiOrderEntity postApiOrderEntity;
  successpostState({required this.postApiOrderEntity});
}

class errorpostState extends PostblocStates{
  final String errormsg;
  errorpostState({required this.errormsg});
}