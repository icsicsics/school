
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_point_event.dart';
part 'add_point_state.dart';

class AddPointBloc extends Bloc<AddPointEvent, AddPointState> {
  AddPointBloc() : super(AddPointInitial()) {
    on<AddPointEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
