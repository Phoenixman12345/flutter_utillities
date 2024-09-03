import 'package:flutter/material.dart';

class Appdata with ChangeNotifier {
  String username = '';
  late UserProfile user;
}

class UserProfile {
  int idx = 0;
  String fullname = '';
}