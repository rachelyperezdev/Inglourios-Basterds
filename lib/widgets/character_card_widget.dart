import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inglourious_basterds/models/character.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  CharacterCardState createState() => CharacterCardState();
}

class CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.withOpacity(0.1)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  widget.character.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: const Color.fromARGB(255, 79, 0, 0).withOpacity(0.5),
                  child: Text(
                    widget.character.name,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 191, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
