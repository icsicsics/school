import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/data/source/remote/model/channels/video.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:rxdart/rxdart.dart';

class ChannelsVideoWidget extends StatefulWidget {
  final ChannelsData channelsData;
  final VideoPlayerController controller;
  const ChannelsVideoWidget({
    Key? key,
    required this.channelsData,
    required this.controller,
  }) : super(key: key);

  @override
  State<ChannelsVideoWidget> createState() => _ChannelsVideoWidgetState();
}

class _ChannelsVideoWidgetState extends State<ChannelsVideoWidget> {
   GlobalKey globalKey = GlobalKey();
  final time = BehaviorSubject<String>();

  @override
  void initState() {
    super.initState();
    widget.controller
          .initialize().then((_) {
            setState(() {});
          });
    time.add("00:00");
    widget.controller.addListener(() {
      time.add(
          '${widget.controller.value.position.inMinutes}:${(widget.controller.value.position.inSeconds % 60).toString().padLeft(2, '0')}');
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
    return widget.controller.value.isInitialized
        ? InkWell(
            onTap: () {
              if (widget.controller.value.isPlaying) {
                widget.controller.pause();
                widget.channelsData.isPlay = false;
                BlocProvider.of<ChannelsBloc>(context)
                    .add(UpdateVideoEvent(channelsData: widget.channelsData));
              } else {
                widget.controller.play();
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
                    widget.controller,
                    key: globalKey,
                  ),
                  widget.channelsData.isPlay! ? Container() : _buildVideoIcon(),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(9, 8, 23, 0.49),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: StreamBuilder<String>(
                          stream: time,
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data ?? "00:00",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            );
                          }),
                    ),
                  )
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
    widget.controller.pause();
    time.close();
    widget.controller.dispose();
  }
}
