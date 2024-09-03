import 'package:flutter/material.dart';
import 'package:flutter_utillities/pages/navpages/page1.dart';
import 'package:flutter_utillities/pages/navpages/page2.dart';
import 'package:flutter_utillities/pages/widget/my_drawer.dart';
import 'dart:developer';
class MainDrawerPage extends StatefulWidget {
  const MainDrawerPage({super.key});

  @override
  State<MainDrawerPage> createState() => _MainDrawerPageState();
}

class _MainDrawerPageState extends State<MainDrawerPage> {
  Widget currentPage = Container();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => {
        log('Save data before exit!'),
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Main Drawer'),),
        drawer: Mydrawer(),
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          
       items: [ 
         BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'ABC'), 
         BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label:' DEF'),
       ],
      onTap: (value) => {
        // log(value.toString());
        if(value == 0){
          currentPage = Page1NavPage()
        } else if (value == 1){
          currentPage = Page2NavPage()
        },
        setState(() {}),
      },
      ),
    ));
  }
}


