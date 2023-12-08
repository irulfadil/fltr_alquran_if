import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/help_app_controller.dart';

class HelpAppView extends GetView<HelpAppController> {
  const HelpAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: const [
          Center(
            child: Icon(
              Icons.live_help_outlined,
              size: 32,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Deskripsi Help",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12.0,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          SizedBox(height: 10.0),
          Text(
            "Panduan Pengguna:",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          Text(
            "Penjelasan Menu",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12.0,
              letterSpacing: 0.5,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
