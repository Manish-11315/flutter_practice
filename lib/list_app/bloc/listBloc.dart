import 'package:bloc/bloc.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc_events.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc_states.dart';
import 'package:flutter_project_practice/list_app/data/datamodel.dart';

class Listbloc extends Bloc<ListblocEvents, ListblocStates> {
  final List<Datamodel> datamodel;

  Listbloc({required this.datamodel}) : super(listinitialState()) {
    on<addListEvent>(_addlistevent);
    on<deletelistEvent>(_deletelistevent);
    on<initiallistEvent>((event, state) {
      emit(listinitialState());
    });
  }


  void _addlistevent(addListEvent event, Emitter<ListblocStates> emit) {
    datamodel.add(event.datamodel);
    final List<Datamodel> updateList = List.from(datamodel);
    print("Data Added : ${datamodel[0].name}");
    emit(listshowState(datamodel: datamodel));
  }

  void _deletelistevent(deletelistEvent event, Emitter<ListblocStates> emit) {
    datamodel.removeAt(event.id);
    List<Datamodel> deletedlist = List.from(datamodel);
    print("Deleted List object : ${deletedlist.length}");
    emit(listshowState(datamodel: deletedlist));
    // emit(listdeleteState(updatedlist: deletedlist));
  }
}
