import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<GetProfileEvent>(_onGetProfileEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
  }

  FutureOr<void> _onGetProfileEvent(
      GetProfileEvent event, Emitter<ProfileState> emit) {}

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<ProfileState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event, Emitter<ProfileState> emit) {
    emit(NavigateToNotificationScreenState());
  }
}
