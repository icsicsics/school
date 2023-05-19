import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';
import 'package:video_player/video_player.dart';

class AboutContentWidget extends StatefulWidget {
  const AboutContentWidget({Key? key}) : super(key: key);

  @override
  State<AboutContentWidget> createState() => _AboutContentWidgetState();
}

class _AboutContentWidgetState extends State<AboutContentWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://l.top4top.io/m_2683gqn711.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AboutHeaderWidget(),
            Image.asset(
              ImagesPath.logo,
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),


            SizedBox(
              height: 16,
            ),
            MediumTextWidget(
              text: S.of(context).aboutUsDescription,
              fontSize: 16,
              color: ColorsManager.sameBlack,
              maxLines: 10,
            ),

            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
                setState(() {});
              },
              child: SizedBox(
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container(),
                    _controller.value.isPlaying ? Container() : _buildVideoIcon(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoIcon() {
    return _controller.value.isPlaying
        ? Icon(
            Icons.pause,
            size: 50,
          )
        : Icon(
            Icons.play_arrow,
            size: 50,
          );
  }
}
