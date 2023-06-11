import 'package:schools/presentation/bloc/channels/channels_bloc.dart';

abstract class ChannelsRepository {
  Future<ChannelsState> getChannels(bool language);
}


