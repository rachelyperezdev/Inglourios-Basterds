import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:iconly/iconly.dart';
import 'package:inglourious_basterds/widgets/info_builder.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

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
                child: ClipRRect(
                  child: Image.network(
                    'https://c4.wallpaperflare.com/wallpaper/498/86/496/movie-inglourious-basterds-wallpaper-preview.jpg',
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
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 163, 9, 30),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 180, 11, 33),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Color.fromARGB(255, 255, 191, 0),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '2hrs 33mins',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 191, 0),
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 180, 11, 33),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.movie,
                                  color: Color.fromARGB(255, 255, 191, 0),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Bélico | Drama | Aventura',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 191, 0),
                                      fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 180, 11, 33),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Color.fromARGB(255, 255, 191, 0),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '2009',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 191, 0),
                                      fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 163, 9, 30),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          "Bastardos sin gloria es una película ucrónica de acción y drama, ambientada durante la Segunda Guerra Mundial. La historia sigue a dos tramas principales: un grupo de soldados aliados conocidos como 'los Bastardos,' liderados por el teniente Aldo Raine, que se dedica a eliminar nazis en la Francia ocupada, y Shosanna Dreyfus, una joven judía que busca vengar la muerte de su familia a manos de los nazis. La película se caracteriza por su mezcla de humor oscuro, violencia estilizada, y diálogos ingeniosos, ofreciendo una reinterpretación ficticia y provocadora de la historia.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 217, 103),
                              fontSize: 14,
                              height: 2),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 163, 9, 30),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          "DIRECTOR",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 217, 103),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 2),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://prod-images.tcm.com/Master-Profile-Images/QuentinTarantino.189032.jpg',
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Quentin Tarantino",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 217, 103),
                                fontSize: 14,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "PREMIOS",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 217, 103),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAwardItem("Premio Oscar a la Mejor Actuación"),
                          _buildAwardItem("Premio BAFTA a la Mejor Película"),
                          _buildAwardItem(
                              "Premio Globo de Oro a la Mejor Película"),
                          _buildAwardItem("Premio Cannes a la Mejor Dirección"),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ],
    ));
  }

  Widget _buildAwardItem(String award) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.emoji_events, color: Color.fromARGB(255, 255, 217, 103)),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            award,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 217, 103),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
