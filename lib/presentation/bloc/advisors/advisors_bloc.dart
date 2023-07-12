import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/advisors/request/create_meeting_request.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/advisor.dart';
import 'package:schools/data/source/remote/repository/advisors_repository.dart';
import 'package:schools/presentation/bloc/advisors/advisors_repoistory_implementation.dart';

part 'advisors_event.dart';

part 'advisors_state.dart';

class AdvisorsBloc extends Bloc<AdvisorsEvent, AdvisorsState> {
  final AdvisorsRepository _advisorsRepository =
      AdvisorsRepositoryImplementation();

  AdvisorsBloc() : super(AdvisorsInitial()) {
    on<GetGuidesEvent>(_onGetGuidesEvent);
    on<CreateMeetingEvent>(_onCreateMeetingEvent);
    on<OpenRequestMeetingBottomSheetEvent>(
        _onOpenRequestMeetingBottomSheetEvent);
    on<GetAdvisorsEvent>(_onGetAdvisorsEvent);

    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetGuidesEvent(
      GetGuidesEvent event, Emitter<AdvisorsState> emit) async {
    emit(ShowLoadingState());
    String language =
        await SharedPreferencesManager.getLanguageCodeHelper() ?? "en";

    emit(await _advisorsRepository.getGuides(
        event.branchId, language == "en" ? true : false));
    emit(HideLoadingState());
  }

  FutureOr<void> _onOpenRequestMeetingBottomSheetEvent(
      OpenRequestMeetingBottomSheetEvent event, Emitter<AdvisorsState> emit) {
    emit(OpenRequestMeetingBottomSheetState());
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<AdvisorsState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onCreateMeetingEvent(
      CreateMeetingEvent event, Emitter<AdvisorsState> emit) async {
    emit(ShowLoadingState());
    emit(await _advisorsRepository.createMeeting(
      event.request,
    ));
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetAdvisorsEvent(
      GetAdvisorsEvent event, Emitter<AdvisorsState> emit) async {
    emit(ShowLoadingState());
    String language =
        await SharedPreferencesManager.getLanguageCodeHelper() ?? "en";

    emit(await _advisorsRepository.getAdvisors(
      event.classroomToSectionId,
      language == "en" ? true : false,
    ));
    emit(HideLoadingState());
  }
}
