import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 10),
      child: Column(
        children: [
          Image.network(
              'https://static.vecteezy.com/system/resources/thumbnails/013/078/569/small/illustration-of-cute-colored-cat-cartoon-cat-image-in-format-suitable-for-children-s-book-design-elements-introduction-of-cats-to-children-books-or-posters-about-animal-free-png.png',
              height: 100),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('Main Menu'),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: Text('Setting'),
            leading: Icon(Icons.settings_applications),
            onTap: () {},
          ),
          Divider(indent: 20,endIndent: 30,), //การแบ่งสัดส่วน 
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            onTap: () {Navigator.popUntil(context, (route) => route.isFirst);},
          ),
          const Text('copyright @ 2024 Aj.m')
        ],
      ),
    ));
  }
}