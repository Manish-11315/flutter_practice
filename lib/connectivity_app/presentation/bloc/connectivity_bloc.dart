import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_events.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_states.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvents, ConnectivityStates>{

  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription _streamSubscription;

  ConnectivityBloc():super(initialConnectivityState()){
    on<connectedEvent>(_onconnectedeventhandler);
    on<disconnectedEvent>(_ondisconnectedeventhandler);

    // _connectivity.checkConnectivity().then((value) => _connectivity.onConnectivityChanged);
    
    /*_connectivity.checkConnectivity().then((value){
      toggleconnectivity(value);
    });*/
    
    _streamSubscription = _connectivity.onConnectivityChanged.listen((change){
      toggleconnectivity(change);
    });
  }

  void _onconnectedeventhandler(connectedEvent event, Emitter<ConnectivityStates> emit){
    emit(connectedState());
  }

  void _ondisconnectedeventhandler(disconnectedEvent event, Emitter<ConnectivityStates> emit){
    emit(notConnectedState());
  }

  void toggleconnectivity(List<ConnectivityResult> result){
    if(result.contains(ConnectivityResult.none)){
      add(disconnectedEvent());
    }else if(result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.mobile)){
      add(connectedEvent());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }


}