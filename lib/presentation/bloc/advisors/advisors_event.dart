part of 'advisors_bloc.dart';

abstract class AdvisorsEvent extends Equatable {
  const AdvisorsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetGuidesEvent extends AdvisorsEvent {
  final String branchId;

  const GetGuidesEvent({
    required this.branchId,
  });
}

class OpenRequestMeetingBottomSheetEvent extends AdvisorsEvent {
  const OpenRequestMeetingBottomSheetEvent();
}

class CreateMeetingEvent extends AdvisorsEvent {
  final CreateMeetingRequest request;

  const CreateMeetingEvent({
    required this.request,
  });
}

class GetAdvisorsEvent extends AdvisorsEvent {
  final String classroomToSectionId;

  const GetAdvisorsEvent({
    required this.classroomToSectionId,
  });
}

class NavigateBackEvent extends AdvisorsEvent {
  const NavigateBackEvent();
}
