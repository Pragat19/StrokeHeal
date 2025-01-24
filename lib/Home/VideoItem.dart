import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoItems extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  const VideoItems({
    required this.videoPlayerController,
    this.looping = false,
    this.autoplay = false,
  });

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: autoplay,
      looping: looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );

    return AspectRatio(
      aspectRatio:
          16 / 9, // Adjust aspect ratio according to your video's aspect ratio
      child: Chewie(controller: chewieController),
    );
  }
}
