import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/channels/channels.dart';
import 'package:schools/data/source/remote/repository/channels_repository.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';

class ChannelsRepositoryImplementation extends ChannelsRepository {
  @override
  Future<ChannelsState> getChannels(bool language) async {
    Response response = await DioHelper.getChannels(language);
    Channels channels = Channels.fromJson(response.data);
    if (response.statusCode == 200) {
      return GetChannelsSuccessState(channelsData: channels.channelsData!);
    } else {
      return GetChannelsErrorState(errorMessage: channels.errorMessage!);
    }
  }
}
