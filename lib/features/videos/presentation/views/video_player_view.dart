import 'package:cs_academy/core/constants/app_colors.dart';
import 'package:cs_academy/core/theme/text_styles.dart';
import 'package:cs_academy/features/videos/data/models/video_model.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.videoModel});
  final VideoModel videoModel;
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse(widget.videoModel.url))
            ..initialize().then((onValue) {
              setState(() {});
            }),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = flickManager.flickVideoManager?.videoPlayerController;
    return Scaffold(
       appBar: AppBar(
              backgroundColor: Color(AppColors.secondaryColor),
              title: Center(
                child: Text(
                  widget.videoModel.title,
                  style: AppTextStyles.semiheading.copyWith(fontSize: 20),
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(AppColors.primaryColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
      body: controller == null
          ? Center(
              child: CircularProgressIndicator(
                color: Color(AppColors.secondaryColor),
              ),
            )
          : controller.value.hasError
          ? Center(child: Text('Something Went Wrong'))
          : !controller.value.isInitialized
          ? Center(
              child: CircularProgressIndicator(
                color: Color(AppColors.secondaryColor),
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: FlickVideoPlayer(flickManager: flickManager),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          widget.videoModel.title,
                          style: AppTextStyles.semiheading.copyWith(
                            color: Color(0xff0F172A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
