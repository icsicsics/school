import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/data/source/remote/model/weather/main.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final List<ChannelsData> channels;
  final ChannelsData channelsData;

  const VideoScreen({
    Key? key,
    required this.channels,
    required this.channelsData,
  }) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController selectedVideoController;
  late ChewieController selectedChewieVideoController;

  // List<VideoPlayerController> controllers = [];
  // List<ChewieController> chewieControllers = [];
  ChannelsData selectedVideo = ChannelsData();

  @override
  void initState() {
    super.initState();
    selectedVideo = widget.channelsData;
    _initializeSelectedVideo();
    // _initializeVideos();
    // _initializeChewieControllers();
  }

  void _initializeSelectedVideo() {
    selectedVideoController = VideoPlayerController.network(
      selectedVideo.video?.mediaUrl ?? "",
    )..initialize().then((_) {
        setState(() {});
      });

    selectedChewieVideoController = ChewieController(
      videoPlayerController: selectedVideoController,
      autoPlay: true,
      autoInitialize: true,
      looping: false,
    );
    selectedChewieVideoController.play();

  }



  // void _initializeVideos() {
  //   controllers.clear();
  //   for (var controller in widget.channels) {
  //     controllers
  //         .add(VideoPlayerController.network(controller.video?.mediaUrl ?? "")
  //           ..initialize().then(
  //             (_) {
  //               setState(() {});
  //             },
  //           ));
  //   }
  // }
  //
  // void _initializeChewieControllers() {
  //   chewieControllers.clear();
  //   for (var chewieController in controllers) {
  //     chewieControllers.add(ChewieController(
  //       videoPlayerController: chewieController,
  //       autoPlay: false,
  //       looping: false,
  //     ));
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).videos,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              ImagesPath.arrowBackIcon,
              height: 20,
              width: 20,
              matchTextDirection: true,
              fit: BoxFit.scaleDown,
            )),
      ),
      body: Column(
        children: [
          _buildSelectedVideo(context),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: widget.channels.map((e) {
                  if (e == selectedVideo) {
                    return const SizedBox.shrink();
                  }
                  return InkWell(
                    onTap: () {
                      _clearVideosController();
                      selectedVideo = e;
                      _initializeSelectedVideo();
                      // _initializeVideos();
                      // _initializeChewieControllers();
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 200,
                            child: Image.network(
                                e.image?.mediaUrl ?? "",
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/ic_video_placeholder.png",
                                fit: BoxFit.fill,
                              );
                            }),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        e.title ?? "",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   margin: const EdgeInsets.symmetric(horizontal: 16),
                                    //   child: InkWell(
                                    //     onTap: () {
                                    //       BlocProvider.of<ChannelsBloc>(context)
                                    //           .add(ShareVideEvent(
                                    //               url: e.video?.mediaUrl ?? ""));
                                    //     },
                                    //     child: SvgPicture.asset(
                                    //         ImagesPath.shareIcon,
                                    //         matchTextDirection: true),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSelectedVideo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: selectedChewieVideoController
                  .videoPlayerController.value.isInitialized
              ? Chewie(
                  controller: selectedChewieVideoController,
                )
              : Container(),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Text(
                  selectedVideo.description ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 3,
                ),
              ),
              const Expanded(child: SizedBox()),
              // InkWell(
              //   onTap: () {
              //     BlocProvider.of<ChannelsBloc>(context).add(
              //         ShareVideEvent(url: selectedVideo.video?.mediaUrl ?? ""));
              //   },
              //   child: SvgPicture.asset(
              //     ImagesPath.shareIcon,
              //     matchTextDirection: true,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _clearVideosController();
  }

  void _clearVideosController() {
    // for (var controller in controllers) {
    //   chewieControllers[controllers.indexOf(controller)].pause();
    //   chewieControllers[controllers.indexOf(controller)].dispose();
    // }
    selectedVideoController.pause();
    selectedVideoController.dispose();
    selectedChewieVideoController.pause();
    selectedChewieVideoController.dispose();
  }
}

/*
Column(
              children: widget.channels.map((e) {
                if (e == selectedVideo) {
                  return const SizedBox.shrink();
                }
                return InkWell(
                  onTap: () {
                    _clearVideosController();
                    selectedVideo = e;
                    _initializeSelectedVideo();
                    _initializeVideos();
                    _initializeChewieControllers();
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 180,
                          child: Chewie(
                            controller:
                                chewieControllers[widget.channels.indexOf(e)],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                e.title ?? "",
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
                                      e.description ?? "",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      BlocProvider.of<ChannelsBloc>(context)
                                          .add(ShareVideEvent(
                                              url: e.video?.mediaUrl ?? ""));
                                    },
                                    child:
                                        SvgPicture.asset(ImagesPath.shareIcon),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            )
 */
