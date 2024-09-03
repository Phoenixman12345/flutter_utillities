import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_utillities/pages/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class getXPage extends StatefulWidget {
  const getXPage({super.key});

  @override
  State<getXPage> createState() => _getXPageState();
}

class _getXPageState extends State<getXPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                  Get.offAll(() => HomePage());
                },
                icon: Icon(Icons.arrow_back_ios)),
            FilledButton(
              onPressed: () {
                Get.snackbar('แจ้งเตือน!!!', 'คุณถูกแฮ็ค เห้ย ถูกหวย',
                    snackPosition: SnackPosition.TOP, colorText: Colors.red);
              },
              child: const Text('Get SnackBar'),
            ),
            FilledButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'ยินดีด้วย',
                    content: Column(
                      children: [Text('คุณถูกหวย'), Text('ล้อเล่นจ้าเตง')],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('ปิดหน้าต่าง')),
                      FilledButton(
                          onPressed: () {}, child: Text('ซื้อใหม่ดีกว่า'))
                    ]);
              },
              child: const Text('Get Dialog'),
            ),
            FilledButton(
                onPressed: () {
                  if (Get.isDarkMode) {
                    Get.changeTheme(ThemeData.light());
                    log('yes dark');
                  } else {
                    Get.changeTheme(ThemeData.dark());
                  }
                  Get.changeTheme(ThemeData.dark());
                },
                child: const Text('Theme Change')),
            FilledButton(
              onPressed: () {
                var width = Get
                    .width; //การหา size ต่างๆ สำหรับหน้าจอที่แตกต่างกันของแต่ละเครื่อง
                var height = Get.height;
                log('$width x $height');
                var fontSize = Get.textTheme.bodyMedium!.fontSize;
                log(width.toString());
                log('font size: $fontSize');
              },
              child: Text('Get Utilities'),
            ),
            FilledButton(
                onPressed: () {
                  GetStorage storage = GetStorage();
                  String username = storage.read('username');
                  log(username);
                },
                child: Text('Read Storage')),
            FilledButton(
                onPressed: () {
                  GetStorage gs = GetStorage();
                  gs.erase();
                  
                },
                child: Text('Delete Storage'))
          ],
        ),
      ),
    );
  }
}
