part of 'advisors_bloc.dart';

abstract class AdvisorsState extends Equatable {
  const AdvisorsState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AdvisorsInitial extends AdvisorsState {
  @override
  List<Object> get props => [];
}

class ShowLoadingState extends AdvisorsState {}

class HideLoadingState extends AdvisorsState {}

class GetGuidesSuccessState extends AdvisorsState {
  final List<Guide> guides;

  const GetGuidesSuccessState({
    required this.guides,
  });
}

class GetGuidesErrorState extends AdvisorsState {
  final String errorMessage;

  const GetGuidesErrorState({
    required this.errorMessage,
  });
}

class CreateMeetingSuccessState extends AdvisorsState {
  final String message;

  const CreateMeetingSuccessState({
    required this.message,
  });
}

class CreateMeetingErrorState extends AdvisorsState {
  final String errorMessage;

  const CreateMeetingErrorState({
    required this.errorMessage,
  });
}

class OpenRequestMeetingBottomSheetState extends AdvisorsState {}

class NavigateBackState extends AdvisorsState {}