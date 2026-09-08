import 'package:flutter_project_practice/list_app/data/datamodel.dart';

abstract class ListblocEvents {}

class addListEvent extends ListblocEvents{
  final Datamodel datamodel;
  addListEvent({required this.datamodel});
}

class deletelistEvent extends ListblocEvents{
  final int id;
  deletelistEvent({required this.id});
}