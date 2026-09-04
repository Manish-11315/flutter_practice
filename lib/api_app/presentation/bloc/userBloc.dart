import 'package:bloc/bloc.dart';
import 'package:flutter_project_practice/api_app/domain/entities/products_entities/productsEntity.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchallusers_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchsingleuser_usecase.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_events.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_states.dart';

class Userbloc extends Bloc<UserblocEvents, UserblocStates> {
  final FetchallusersUsecase fetchallusersUsecase;
  final FetchsingleuserUsecase fetchsingleuserUsecase;
  List<ProductsEntity> usercache =[];

  Userbloc({
    required this.fetchsingleuserUsecase,
    required this.fetchallusersUsecase,
  }) : super(initialUserBloc()) {
    on<loadsingleuser_event>(_onSingleUserHandler);
    on<getallusersdata_event>(_onLoadAllUserHandler);
    on<initialuserdata_event>(_oninitialUserHandler);
    on<getdata_list_event>(_onresetlistHandler);
  }

  void _onSingleUserHandler(
    loadsingleuser_event event,
    Emitter<UserblocStates> emit,
  ) async{
      emit(loadingUserBloc());
    try {
      final data = await fetchsingleuserUsecase.call(id: event.id);
      emit(singleUserdataUserBloc(userentity: data));
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
      usercache = data;
      emit(listAllUserdataUserBloc(userentity: usercache));
    }catch (err){
      emit(errorUserBloc(errormsg: err.toString()));
    }
  }

  void _oninitialUserHandler(initialuserdata_event event, Emitter<UserblocStates> emit){
    emit(initialUserBloc());
  }

  void _onresetlistHandler(getdata_list_event event, Emitter<UserblocStates> emit){
    emit(listAllUserdataUserBloc(userentity: usercache));
  }
}
