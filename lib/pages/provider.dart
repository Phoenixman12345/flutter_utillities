import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_utillities/shared/app_data.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  String uname = '';
  late UserProfile user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uname = context.read<Appdata>().username;
    user = context.read<Appdata>().user;
    log(uname);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(uname), Text(user.idx.toString()), Text(user.fullname),
        ],
      ),
    );
  }
}