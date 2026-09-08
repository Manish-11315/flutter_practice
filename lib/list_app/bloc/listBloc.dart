import 'package:bloc/bloc.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc_events.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc_states.dart';
import 'package:flutter_project_practice/list_app/data/datamodel.dart';

class Listbloc extends Bloc<ListblocEvents, ListblocStates>{
  final List<Datamodel> datamodel;
  Listbloc({required this.datamodel}) : super(listinitialState()){
    on<addListEvent>(_addlistevent);
    on<deletelistEvent>(_deletelistevent);
  }
  void _addlistevent(addListEvent event, Emitter<ListblocStates> emit){
    datamodel.add(event.datamodel);
    List<Datamodel> updatedlist = datamodel;
    emit(listshowState(datamodel: updatedlist));
  }
  void _deletelistevent(deletelistEvent event, Emitter<ListblocStates> emit){
    datamodel.removeAt(event.id);
    List<Datamodel> deletedlist = datamodel;
    emit(listdeleteState(updatedlist: deletedlist));
  }
}