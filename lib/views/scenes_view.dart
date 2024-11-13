import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:iconly/iconly.dart';
import 'package:inglourious_basterds/models/scenes.dart';
import 'package:inglourious_basterds/views/details_scene_view.dart';
import 'package:inglourious_basterds/widgets/scene_card_widget.dart';

class ScenesView extends StatefulWidget {
  const ScenesView({super.key});

  @override
  SceneStateView createState() => SceneStateView();
}

class SceneStateView extends State<ScenesView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Expanded(child: _buildAllScenes()),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _buildAllScenes() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: (110 / 80), mainAxisSpacing: 12),
      itemCount: InglouriousBasterdsScenes.allScenes.length,
      itemBuilder: (context, index) {
        final allScenes = InglouriousBasterdsScenes.allScenes[index];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsSceneView(
                        scene: allScenes,
                      ))),
          child: SceneCard(scene: allScenes),
        );
      });
}
