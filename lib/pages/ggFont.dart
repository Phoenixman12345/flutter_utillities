import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class GGFont extends StatefulWidget {
  const GGFont({super.key});

  @override
  State<GGFont> createState() => _GGFontState();
}

class _GGFontState extends State<GGFont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('วันนี้่เรียนเร็วจัง', style: TextStyle(fontSize: Get.textTheme.displayMedium!.fontSize, fontFamily: GoogleFonts.itim().fontFamily),),
            Text('today is so fast bro', style: TextStyle(fontSize: Get.textTheme.displaySmall!.fontSize,fontFamily: GoogleFonts.itim().fontFamily),),
          ],
        ),
      ),
    );
  }
}