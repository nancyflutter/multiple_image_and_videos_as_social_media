import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiple_image_and_videos_as_social_media/core/constant/colors_constants.dart';
import 'package:video_player/video_player.dart';

class CommonVideoPlayer extends StatefulWidget {
  final String url;
  final double? aspectRatio;
  final bool isShowPlayPause;
  const CommonVideoPlayer({super.key, required this.url, this.aspectRatio, this.isShowPlayPause = false});

  @override
  State<CommonVideoPlayer> createState() => _CommonVideoPlayerState();
}

class _CommonVideoPlayerState extends State<CommonVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isControllerInitialized = false;
  bool _isPlaying = false;
  bool _showControls = true;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
    _startHideControlsTimer();
  }

  void _toggleControlsVisibility() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) {
      _startHideControlsTimer();
    }
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  void _initializeController() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isControllerInitialized = true;
          });
        }
      });
    print("widget.url :::::::::::: ${widget.url}");
  }

  @override
  Widget build(BuildContext context) {
    return _isControllerInitialized
        ? GestureDetector(
            onTap: widget.isShowPlayPause
                ? _toggleControlsVisibility
                : () {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: widget.aspectRatio ?? _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                if (_isControllerInitialized && widget.isShowPlayPause)
                  Center(
                    child: IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          color: Colors.white,
                        ),
                        onPressed: _togglePlayPause),
                  ),
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(
            color: MyColors.greenBorderColor,
          ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideControlsTimer?.cancel();
    super.dispose();
  }
}
