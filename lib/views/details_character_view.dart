import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inglourious_basterds/models/character.dart';
import 'package:inglourious_basterds/widgets/info_builder.dart';

class DetailsCharacterView extends StatelessWidget {
  final Character character;
  const DetailsCharacterView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
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
                    child: ClipRRect(
                      child: Image.network(
                        character.imageUrl,
                        fit: BoxFit.cover,
                      ),
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
                          character.name.toUpperCase(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 191, 0),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 14),
                        if (character.alias != null &&
                            character.alias!.isNotEmpty) ...[
                          Text(
                            character.alias!,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 191, 0),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 163, 9, 30),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Interpretado por: ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 191, 0),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                TextSpan(
                                  text: character.potrayedBy,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 191, 0),
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 163, 9, 30),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Aliado a: ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 191, 0),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                TextSpan(
                                  text: character.allegiance,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 191, 0),
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          character.description,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 191, 0),
                              fontSize: 14,
                              height: 2),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 229, 151),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border(
                              left: BorderSide(
                                color: Color.fromARGB(255, 237, 177, 0),
                                width: 4.0,
                              ),
                            ),
                          ),
                          child: Text(
                            character.notableQuote,
                            style: TextStyle(
                                color: Color.fromARGB(255, 163, 9, 30),
                                fontSize: 16,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Color.fromARGB(255, 163, 9, 30),
            padding: EdgeInsets.all(8.0),
            child: const InfoBuilder(),
          ),
        ],
      ),
    );
  }
}
