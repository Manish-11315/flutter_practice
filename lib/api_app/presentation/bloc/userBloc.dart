import 'package:bloc/bloc.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchallusers_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchsingleuser_usecase.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_events.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_states.dart';

class Userbloc extends Bloc<UserblocEvents, UserblocStates> {
  final FetchallusersUsecase fetchallusersUsecase;
  final FetchsingleuserUsecase fetchsingleuserUsecase;

  Userbloc({
    required this.fetchsingleuserUsecase,
    required this.fetchallusersUsecase,
  }) : super(initialUserBloc()) {
    on<loadsingleuser_event>(_onSingleUserHandler);
    on<getallusersdata_event>(_onLoadAllUserHandler);
  }

  void _onSingleUserHandler(
    loadsingleuser_event event,
    Emitter<UserblocStates> emit,
  ) async{
      emit(loadingUserBloc());
    try {
      final data = await fetchsingleuserUsecase.call(id: event.id);
      emit(dataUserBloc(userentity: data));
    } catch (err) {
      emit(errorUserBloc(errormsg: err.toString()));
    }
  }

  void _onLoadAllUserHandler(
    getallusersdata_event event,
    Emitter<UserblocStates> emit,
  ) async{
    emit(loadingUserBloc());
    try{
      final data = await fetchallusersUsecase.call();
      final datalist = data.map((dataobj) => dataobj).toList();
      emit(dataUserBloc(userentity: datalist));
    }catch (err){
      emit(errorUserBloc(errormsg: err.toString()));
    }
  }
}
