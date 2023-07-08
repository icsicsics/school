part of 'channels_bloc.dart';

abstract class ChannelsEvent extends Equatable {
  const ChannelsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetChannelsEvent extends ChannelsEvent {
  final String type;

  const GetChannelsEvent({
    required this.type,
  });
}

class NavigateBackEvent extends ChannelsEvent {}

class UpdateVideoEvent extends ChannelsEvent {
  final ChannelsData channelsData;

  const UpdateVideoEvent({
    required this.channelsData,
  });
}

class ShareVideEvent extends ChannelsEvent {
  final String url;

  const ShareVideEvent({
    required this.url,
  });
}

class NavigateToLoginScreenEvent extends ChannelsEvent{
  const NavigateToLoginScreenEvent();
}


