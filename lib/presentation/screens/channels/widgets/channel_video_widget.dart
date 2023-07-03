import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:schools/presentation/screens/channels/video_screen.dart';

class ChannelsVideoWidget extends StatefulWidget {
  final List<ChannelsData> channels;
  final ChannelsData channelsData;

  const ChannelsVideoWidget({
    Key? key,
    required this.channels,
    required this.channelsData,
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
            },
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                widget.channelsData.thumbnail ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Text(
          //   widget.channelsData.title ?? "",
          //   style: const TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          // ),
          // const SizedBox(height: 8),
          Row(
            children: [
              Text(
                widget.channelsData.description ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: () {
                  BlocProvider.of<ChannelsBloc>(context).add(ShareVideEvent(
                      url: widget.channelsData.video?.mediaUrl ?? ""));
                },
                child: SvgPicture.asset(
                  ImagesPath.shareIcon,
                  matchTextDirection: true,
                ),
              ),
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
