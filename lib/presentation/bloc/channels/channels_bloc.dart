import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/data/source/remote/model/channels/video.dart';
import 'package:schools/data/source/remote/repository/channels_repository.dart';
import 'package:schools/presentation/bloc/channels/channels_repository_implementation.dart';

part 'channels_event.dart';

part 'channels_state.dart';

class ChannelsBloc extends Bloc<ChannelsEvent, ChannelsState> {
  final ChannelsRepository _channelsRepository =
      ChannelsRepositoryImplementation();

  ChannelsBloc() : super(ChannelsInitial()) {
    on<GetChannelsEvent>(_onGetChannelsEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<UpdateVideoEvent>(_onUpdateVideoEvent);
    on<ShareVideEvent>(_onShareVideEvent);
    on<NavigateToLoginScreenEvent>(_onNavigateToLoginScreenEvent);
  }

  FutureOr<void> _onGetChannelsEvent(
      GetChannelsEvent event, Emitter<ChannelsState> emit) async {
    emit(ShowLoadingState());
    String language = await SharedPreferencesManager.getLanguageCodeHelper() ?? "en";
    String token = await SharedPreferencesManager.getTokenDio() ?? "";
    if(token.isEmpty){
      emit(await _channelsRepository.getChannels(language == "en" ? true : false));
    } else {
      emit(await _channelsRepository.getTeacherChannels(language == "en" ? true : false));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<ChannelsState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onUpdateVideoEvent(
      UpdateVideoEvent event, Emitter<ChannelsState> emit) {
    emit(UpdateVideoState(channelsData: event.channelsData));
  }

  FutureOr<void> _onShareVideEvent(
      ShareVideEvent event, Emitter<ChannelsState> emit) async {
    emit(ShareVideoState(url: event.url));
  }

  FutureOr<void> _onNavigateToLoginScreenEvent(
      NavigateToLoginScreenEvent event, Emitter<ChannelsState> emit) {
    emit(NavigateToLoginScreenState());
  }
}
