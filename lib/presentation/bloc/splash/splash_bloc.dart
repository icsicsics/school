import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/remote/model/get_token/response/get_token_response.dart';
import 'package:schools/data/source/remote/repository/splash_repository.dart';
import 'package:schools/presentation/bloc/splash/splash_repository_imp.dart';
import 'package:schools/use_case/set_token_use_case.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashRepository repository = SplashRepositoryImp();
  final SetTokenUseCase _setTokenUseCase;

  SplashBloc(this._setTokenUseCase) : super(SplashInitial()) {
    on<SplashGetTokenEvent>(_onSplashGetTokenEvent);
    on<SplashSaveTokenEvent>(_onSplashSaveTokenEvent);
  }

  FutureOr<void> _onSplashGetTokenEvent(
      SplashGetTokenEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoadingState());
    SplashState state = (await repository.getToken()) as SplashState;
    if (state is SplashGetTokenSuccessState) {
      emit(SplashGetTokenSuccessState(response: state.response));
    }else if (state is SplashGetTokenErrorState){
      emit(SplashGetTokenErrorState(error: state.error));
    }
  }

  FutureOr<void> _onSplashSaveTokenEvent(
      SplashSaveTokenEvent event, Emitter<SplashState> emit) {
    _setTokenUseCase.call(token: event.token);
    emit(SplashSaveTokenSuccessState());
  }
}
