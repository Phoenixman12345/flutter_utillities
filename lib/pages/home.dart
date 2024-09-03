import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_utillities/pages/calender.dart';
import 'package:flutter_utillities/pages/getX.dart';
import 'package:flutter_utillities/pages/ggFont.dart';
import 'package:flutter_utillities/pages/main_drawer.dart';
import 'package:flutter_utillities/pages/provider.dart';
import 'package:flutter_utillities/shared/app_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetStorage gs = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      String username = gs.read('username');
      log(username);
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Get.to(() => const getXPage());
      });
      // Get.to(() => GetXPage());
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      //ตรวจสอบการ pop
      canPop: false, //ตั้งให้หน้า home ไม่สามารถ pop ได้มากกว่านี้อีก
      // onPopInvoked: (didPop) => {
      //   log('Save data before exit!'),
      // },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainDrawerPage()));
                },
                child: Text('demo drawer')),
            FilledButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color.fromARGB(128, 255, 0, 0),
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Text('Toast')),
            FilledButton(
                onPressed: () {
                  GetStorage gs = GetStorage();
                  //Storage =>  เก็บ unique-key, value
                  gs.write('username',
                      'admin'); //เก็บ admin ไว้ใน storage โดยที่มีชื่อว่า username ในนั้นนั่นเอง

                  Get.to(() => const getXPage());
                },
                child: Text('getX')),
            FilledButton(
                onPressed: () {
                  Get.to(() => const GGFont());
                },
                child: Text('GG Font')),
            FilledButton(
                onPressed: () {
                  context.read<Appdata>().username = 'Admin';
                  UserProfile user = UserProfile();
                  user.idx = 1234;
                  user.fullname = 'man eng jao';
                  context.read<Appdata>().user = user;
                  Get.to(() => const ProviderPage());
                },
                child: Text('Demo Provider')),
                FilledButton(
                onPressed: () {
                  Get.to(() => const CanlenderPage());
                },
                child: Text('Calender go go')),
          ],
        ),
      ),
    );
  }
}
