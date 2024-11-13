import 'package:flutter/material.dart' hide CarouselController;
import 'package:google_fonts/google_fonts.dart';

class InfoBuilder extends StatelessWidget {
  const InfoBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Creado por ',
              style: const TextStyle(
                color: Color.fromARGB(255, 171, 170, 170),
              ),
              children: [
                TextSpan(
                  text: 'Rachely Pérez\n',
                  style: GoogleFonts.acme(
                    color: Color.fromARGB(255, 255, 191, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: '@rachelyperezdev',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 221, 221, 221),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
