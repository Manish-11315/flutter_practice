import 'package:flutter_project_practice/list_app/data/datamodel.dart';

abstract class ListblocStates {}

class listinitialState extends ListblocStates{}

class listshowState extends ListblocStates{
  final List<Datamodel> datamodel;
  listshowState({required this.datamodel});
}

class listdeleteState extends ListblocStates{
  final List<Datamodel> updatedlist;
  listdeleteState({required this.updatedlist});
}

