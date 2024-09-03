import 'package:flutter/material.dart';
// import 'package:flutter_utilities/pages/main_drawer.dart';
// import 'package:flutter_utilities/pages/home.dart';
import 'package:flutter_utillities/pages/main_drawer.dart';
import 'package:flutter_utillities/pages/home.dart';
import 'package:flutter_utillities/shared/app_data.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() async {
  await GetStorage.init(); //ใส่ getStorage ตรงนี้นะแกร
  // runApp(const MyApp());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Appdata()),
  ], child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // รองรับ English
        Locale('th', 'TH'), // รองรับ Thai
      ],
	  theme: ThemeData(textTheme: GoogleFonts.notoSansThaiTextTheme()),
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
