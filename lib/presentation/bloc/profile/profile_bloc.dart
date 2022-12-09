import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<GetProfileEvent>(_onGetProfileEvent);
  }

  FutureOr<void> _onGetProfileEvent(GetProfileEvent event, Emitter<ProfileState> emit) {
  }
}
