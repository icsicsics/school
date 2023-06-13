import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/data/source/remote/model/channels/video.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:video_player/video_player.dart';

class ChannelsVideoWidget extends StatefulWidget {
  final ChannelsData channelsData;

  const ChannelsVideoWidget({
    Key? key,
    required this.channelsData,
  }) : super(key: key);

  @override
  State<ChannelsVideoWidget> createState() => _ChannelsVideoWidgetState();
}

class _ChannelsVideoWidgetState extends State<ChannelsVideoWidget> {
  late VideoPlayerController _controller;
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(widget.channelsData.video?.mediaUrl ?? "")
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildVideo(),
          SizedBox(
            height: 12,
          ),
          Text(
            widget.channelsData.title ?? "",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                widget.channelsData.description ?? "",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              Expanded(child: SizedBox()),
              InkWell(
                onTap: () {
                  BlocProvider.of<ChannelsBloc>(context).add(ShareVideEvent(
                      url: widget.channelsData.video?.mediaUrl ?? ""));
                },
                child: SvgPicture.asset(ImagesPath.shareIcon),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 1.5,
            color: Color.fromRGBO(217, 217, 217, 1),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildVideo() {
    return _controller.value.isInitialized
        ? InkWell(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
                widget.channelsData.isPlay = false;
                BlocProvider.of<ChannelsBloc>(context)
                    .add(UpdateVideoEvent(channelsData: widget.channelsData));
              } else {
                _controller.play();
                widget.channelsData.isPlay = true;
                BlocProvider.of<ChannelsBloc>(context)
                    .add(UpdateVideoEvent(channelsData: widget.channelsData));
              }
              setState(() {});
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(
                    _controller,
                    key: globalKey,
                  ),
                  widget.channelsData.isPlay! ? Container() : _buildVideoIcon(),
                ],
              ),
            ),
          )
        : Container(
            width: double.infinity,
            height: 200,
            child: Center(
              child: Container(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(),
              ),
            ),
          );
  }

  Widget _buildVideoIcon() {
    return widget.channelsData.isPlay!
        ? Icon(
            Icons.pause,
            size: 50,
          )
        : Icon(
            Icons.play_arrow,
            size: 50,
          );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
    _controller.dispose();
  }
}
