import 'dart:io';
import 'dart:ui';

import 'package:chewie/src/chewie_player.dart';
import 'package:chewie/src/cupertino_controls.dart';
import 'package:chewie/src/material_controls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerWithControls extends StatelessWidget {
  PlayerWithControls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChewieController chewieController = ChewieController.of(context);
    return Center(child: _buildPlayerWithControls(chewieController, context));
  }

  Container _buildPlayerWithControls(
      ChewieController chewieController, BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          chewieController.placeholder ?? Container(),
          Center(
            child: Padding(
              child: Hero(
                tag: chewieController.videoPlayerController,
                child: AspectRatio(
                    aspectRatio: chewieController.aspectRatio,
                    child: VideoPlayer(chewieController.videoPlayerController)),
              ),
              padding: EdgeInsets.only(
                top: Platform.isAndroid &&
                        MediaQuery.of(context).orientation !=
                            Orientation.landscape
                    ? 1
                    : 0,
                left: Platform.isAndroid &&
                        MediaQuery.of(context).orientation !=
                            Orientation.landscape
                    ? 2
                    : 0,
                right: Platform.isAndroid &&
                        MediaQuery.of(context).orientation !=
                            Orientation.landscape
                    ? 2
                    : 0,
              ),
            ),
          ),
          chewieController.overlay ?? Container(),
          _buildControls(context, chewieController),
        ],
      ),
    );
  }

  Widget _buildControls(
    BuildContext context,
    ChewieController chewieController,
  ) {
    return chewieController.showControls
        ? chewieController.customControls != null
            ? chewieController.customControls
            : Theme.of(context).platform == TargetPlatform.android
                ? MaterialControls()
                : CupertinoControls(
                    backgroundColor: Color.fromRGBO(41, 41, 41, 0.7),
                    iconColor: Color.fromARGB(255, 200, 200, 200),
                  )
        : Container();
  }
}
