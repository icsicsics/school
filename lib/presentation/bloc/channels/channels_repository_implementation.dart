import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/channels/channels.dart';
import 'package:schools/data/source/remote/repository/channels_repository.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ChannelsRepositoryImplementation extends ChannelsRepository {
  @override
  Future<ChannelsState> getChannels(bool language) async {
    Response response = await DioHelper.getChannels(language);
    Channels channels = Channels.fromJson(response.data);
    if (response.statusCode == 200) {
      for(var item in channels.channelsData!){
        String? path = await VideoThumbnail.thumbnailFile(
          video: item.video?.mediaUrl ??"",
          thumbnailPath: (await getApplicationDocumentsDirectory()).path,
          imageFormat: ImageFormat.JPEG,
          maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
          quality: 75,
        );
        item.thumbnail = path;
      }
      return GetChannelsSuccessState(channelsData: channels.channelsData!);
    } else {
      return GetChannelsErrorState(errorMessage: channels.errorMessage!);
    }
  }
}

