import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'school_houses_event.dart';
part 'school_houses_state.dart';

class SchoolHousesBloc extends Bloc<SchoolHousesEvent, SchoolHousesState> {
  SchoolHousesBloc() : super(SchoolHousesInitial()) {
    on<SchoolHousesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
