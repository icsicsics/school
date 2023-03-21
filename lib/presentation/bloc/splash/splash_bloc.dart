import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/domain/usecases/get_token_use_case.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetTokenUseCase _getTokenUseCase;

  SplashBloc(
    this._getTokenUseCase,
  ) : super(SplashInitial()) {
    on<GetTokenEvent>(_onGetTokenEvent);
  }


  FutureOr<void> _onGetTokenEvent(
      GetTokenEvent event, Emitter<SplashState> emit) async {
    String token = await _getTokenUseCase() ?? "";
    emit(GetTokenState(token: token));
  }
}
