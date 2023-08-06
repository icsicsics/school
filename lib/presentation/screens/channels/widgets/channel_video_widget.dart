import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:schools/presentation/screens/channels/full_video_screen.dart';
import 'package:schools/presentation/screens/channels/video_screen.dart';
import 'package:video_player/video_player.dart';

class ChannelsVideoWidget extends StatefulWidget {
  final List<ChannelsData> channels;
  final ChannelsData channelsData;
  // final VideoPlayerController controller;
  final String type;

  const ChannelsVideoWidget({
    Key? key,
    required this.channels,
    required this.channelsData,
    required this.type,
    // required this.controller,
  }) : super(key: key);

  @override
  State<ChannelsVideoWidget> createState() => _ChannelsVideoWidgetState();
}

class _ChannelsVideoWidgetState extends State<ChannelsVideoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (widget.type == "ejabi") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return VideoScreen(
                        channels: widget.channels,
                        channelsData: widget.channelsData,
                      );
                    },
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FullVideoScreen(
                        channelsData: widget.channelsData,
                      );
                    },
                  ),
                );
              }
            },
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                      widget.channelsData.image?.mediaUrl ?? "",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/ic_video_placeholder.png",
                      fit: BoxFit.cover,
                    );
                  }),
                ),
                // Positioned.directional(
                //   end: 0,
                //   bottom: 0,
                //   textDirection: Directionality.of(context),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.black.withOpacity(0.1),
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                //     child: Center(
                //       child: Row(
                //         children: [
                //           Text(
                //               "${(widget.controller.value.duration.inSeconds ~/ 60).toString().padLeft(2, '0')}:${(widget.controller.value.duration.inSeconds % 60).toString().padLeft(2, '0')}",
                //               style: const TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.white,
                //               )),
                //         ],
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.channelsData.title ?? "",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.channelsData.description ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: InkWell(
              //     onTap: () {
              //       BlocProvider.of<ChannelsBloc>(context).add(ShareVideEvent(
              //           url: widget.channelsData.video?.mediaUrl ?? ""));
              //     },
              //     child: SvgPicture.asset(
              //       ImagesPath.shareIcon,
              //       matchTextDirection: true,
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 1.5,
            color: const Color.fromRGBO(217, 217, 217, 1),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
