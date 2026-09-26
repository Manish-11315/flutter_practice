import 'package:bloc/bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postbloc_events.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postbloc_states.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/getUserUseCase.dart';

@injectable
class Postbloc extends Bloc<PostblocEvents, PostblocStates> {
  final Getuserusecase getuserusecaseinstance;

  Postbloc({required this.getuserusecaseinstance}) : super(initialpostState()) {
    on<sendreqestEvent>(_sendRequestHandler);
  }

  void _sendRequestHandler(
    sendreqestEvent event,
    Emitter<PostblocStates> emit,
  ) async {
    emit(loadingpostState());
    try {
      final data = await getuserusecaseinstance.call(
        id: event.id,
        name: event.name,
        email: event.email,
        created_at: event.creation_date,
      );
      emit(successpostState(postApiOrderEntity: data));
    } catch (err) {
      emit(errorpostState(errormsg: err.toString()));
    }
  }
}
