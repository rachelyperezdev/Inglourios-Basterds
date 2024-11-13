import 'package:flutter/material.dart' hide CarouselController;
import 'package:iconly/iconly.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PersonalExperienceView extends StatefulWidget {
  const PersonalExperienceView({super.key});

  @override
  PersonalExperienceState createState() => PersonalExperienceState();
}

class PersonalExperienceState extends State<PersonalExperienceView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
        videoId: 'p7Hhn0z2NwY',
        autoPlay: true,
        params: const YoutubePlayerParams(
            showFullscreenButton: true, showControls: true, loop: true));
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "En mi vida",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 191, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 64, vertical: 12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 163, 9, 30),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        "*Estructura no convencional\n*Personajes memorables\n*Visuales y audios\n*Ucronía\n*Moral de la venganza",
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
      ],
    ));
  }

  void _exitFullscreen() {
    _controller.exitFullScreen();
  }
}
