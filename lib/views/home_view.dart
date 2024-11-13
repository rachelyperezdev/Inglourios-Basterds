import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:inglourious_basterds/data.dart';
import 'package:inglourious_basterds/helpers/banner_slider.dart';
import 'package:inglourious_basterds/helpers/image_viewer.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late CarouselSliderController innerCarouselController;
  late YoutubePlayerController _controller;
  int innerCurrentPage = 0;

  @override
  void initState() {
    innerCarouselController = CarouselSliderController();
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
        videoId: 'XrDTjOV7kU0',
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
    Size size;
    double height, width;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: width * 1,
              height: 150,
              child: Image.network(
                'https://www.pngplay.com/wp-content/uploads/12/Inglourious-Basterds-PNG-Images-HD.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            YoutubePlayer(
              controller: _controller,
              aspectRatio: 16 / 9,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Una película de Quentin Tarantino',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 191, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InnerBannerSlider(
              carouselController: innerCarouselController,
              currentPage: innerCurrentPage,
              imagePaths: AppData.innerStyleImages,
              height: height,
              width: width,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  // Inner Banner
  Widget _innerBannerSlider(double height, double width) {
    double sliderHeight;

    if (width > 1200) {
      sliderHeight = height * 0.6;
    } else if (width > 800) {
      sliderHeight = height * 0.4;
    } else {
      sliderHeight = height * 0.25;
    }

    return Column(
      children: [
        SizedBox(
          height: sliderHeight,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                  child: CarouselSlider(
                carouselController: innerCarouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    aspectRatio: 16 / 8,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        innerCurrentPage = index;
                      });
                    }),
                items: AppData.innerStyleImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CustomImageViewer.show(
                        context: context,
                        url: imagePath,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }).toList(),
              )),
            ],
          ),
        )
      ],
    );
  }
}
