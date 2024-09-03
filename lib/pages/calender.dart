import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'dart:developer';

import 'package:google_fonts/google_fonts.dart';

class CanlenderPage extends StatefulWidget {
  const CanlenderPage({super.key});

  @override
  State<CanlenderPage> createState() => _CanlenderPageState();
}

class _CanlenderPageState extends State<CanlenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            FilledButton(
                onPressed: () async {
                  DateTime? newDateTime = await showRoundedDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 1),
                    lastDate: DateTime(DateTime.now().year + 1),
                    borderRadius: 16,
                    locale: const Locale("th", "TH"), //เปลี่ยนเป็นภาษาไทย เดือนไทย วันไทย รักประเทศไทย ปิดสวิทซ์สามป.
                    era: EraMode.BUDDHIST_YEAR, //เปลี่ยนเป็นพุทธศักราช 
                    fontFamily: GoogleFonts.itim().fontFamily //ต่อให้จะเลือกวันตอนที่เปลี่ยนเป้นไทยแล้ว แต่ก็ยังคงอังกฤษเช่นเดิมนะ ระวังพลาด
                  ); //ไทยใช้ วัน/เดือน/ปี ส่วนฝารั่งใช้ ปี/วัน/เดือน
                  if (newDateTime != null) {
                    log(newDateTime.toString());
                  } else {
                    log('No Date Selected');
                  }
                },
                child: Text('Show Calender')),
          ],
        ),
      ),
    );
  }
}
