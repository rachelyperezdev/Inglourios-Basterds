import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:google_fonts/google_fonts.dart';
import 'package:inglourious_basterds/mainwrapper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bastardos sin gloria",
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.adamina().fontFamily,
          scaffoldBackgroundColor: const Color(0xFF8D0617)),
      home: const Banner(
        message: 'I.B.',
        location: BannerLocation.topEnd,
        child: MainWrapper(),
      ),
    );
  }
}
