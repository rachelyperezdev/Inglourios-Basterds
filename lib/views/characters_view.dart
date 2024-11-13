import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:iconly/iconly.dart';
import 'package:inglourious_basterds/models/characters.dart';
import 'package:inglourious_basterds/views/details_character_view.dart';
import 'package:inglourious_basterds/widgets/character_card_widget.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  CharactersViewState createState() => CharactersViewState();
}

class CharactersViewState extends State<CharactersView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Expanded(child: _buildAllCharacters()),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _buildAllCharacters() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: InglouriousBasterdsCharacters.allCharacters.length,
        itemBuilder: (context, index) {
          final allCharacters =
              InglouriousBasterdsCharacters.allCharacters[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsCharacterView(character: allCharacters))),
            child: CharacterCard(character: allCharacters),
          );
        },
      );
}
