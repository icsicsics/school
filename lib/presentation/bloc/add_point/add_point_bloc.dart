import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/repository/teacher_principl_by_classroomId_repository.dart';
import 'package:schools/presentation/bloc/add_point/teacher_principl_by_classroomId_repository_imp.dart';

part 'add_point_event.dart';

part 'add_point_state.dart';

class AddPointBloc extends Bloc<AddPointEvent, AddPointState> {
  final BaseTeacherPrincipleByClassroomIdRepository _repository =
      TeacherPrincipleByClassroomIdRepositoryImp();

  AddPointBloc() : super(AddPointInitialState()) {
    on<GetAddPointEvent>(_onGetAddPointEvent);
  }

  FutureOr<void> _onGetAddPointEvent(
      GetAddPointEvent event, Emitter<AddPointState> emit) async {
    emit(AddPointLoadingState());
    AddPointState state = (await _repository.getTeacherPrincipleByClassroomId(
        event.token, event.classroomId)) as AddPointState;
    if (state is GetTeacherPrinciplByClassroomIdSuccessState) {
      emit(GetTeacherPrinciplByClassroomIdSuccessState(
          response: state.response));
    } else if (state is GetTeacherPrinciplByClassroomIdFillState) {
      emit(GetTeacherPrinciplByClassroomIdFillState(error: state.error));
    }
  }
}
