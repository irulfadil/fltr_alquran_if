import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../utils/color_system.dart';
import '../controllers/qiblah_controller.dart';
import 'qiblah_screen.dart';

class QiblahView extends GetView<QiblahController> {
  const QiblahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qiblah'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getPermission(),
        builder: (context, snapshot) {
          if (controller.hasPermission) {
            return const QiblahScreen();
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/data_empty.png",
                      width: 100,
                      height: 100,
                    ),
                    const Text(
                      "Data Empty",
                      style: TextStyle(
                        color: ColorSystem.appColorGray,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
