part of 'channels_bloc.dart';

abstract class ChannelsState extends Equatable {
  const ChannelsState();

  @override
  List<Object> get props => [];
}

class ChannelsInitial extends ChannelsState {}

class ShowLoadingState extends ChannelsState {}

class HideLoadingState extends ChannelsState {}

class GetChannelsSuccessState extends ChannelsState {
  final List<ChannelsData> channelsData;

  const GetChannelsSuccessState({
    required this.channelsData,
  });
}


class GetChannelsErrorState extends ChannelsState {
  final String errorMessage;

  const GetChannelsErrorState({
    required this.errorMessage,
  });
}

class NavigateBackState extends ChannelsState {}

class UpdateVideoState extends  ChannelsState{
  final ChannelsData channelsData;

  const UpdateVideoState({
    required this.channelsData,
  });
}

class ShareVideoState extends ChannelsState {
  final String url;

  const ShareVideoState({
    required this.url,
  });
}

class NavigateToLoginScreenState extends ChannelsState{}
