import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inglourious_basterds/models/scene.dart';
import 'package:inglourious_basterds/widgets/info_builder.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailsSceneView extends StatefulWidget {
  final IngloriousBasterdsScene scene;
  const DetailsSceneView({super.key, required this.scene});

  @override
  DetailsSceneState createState() => DetailsSceneState();
}

class DetailsSceneState extends State<DetailsSceneView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
        videoId: widget.scene.videoId,
        autoPlay: true,
        params: YoutubePlayerParams(
            showFullscreenButton: true, showControls: true, loop: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.scene.title,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 191, 0),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 163, 9, 30),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 191, 0)),
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    child: YoutubePlayer(
                      controller: _controller,
                      aspectRatio: 16 / 9,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(32),
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 350,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF8D0617),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.scene.title.toUpperCase(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 191, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 163, 9, 30),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            widget.scene.description,
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 217, 103),
                                fontSize: 14,
                                height: 2),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
              width: double.infinity,
              color: Color.fromARGB(255, 163, 9, 30),
              padding: EdgeInsets.all(8.0),
              child: const InfoBuilder(),
            ),
          ],
        ));
  }
}
