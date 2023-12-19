import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../controllers/qiblah_controller.dart';
import 'widget_location_error.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  final qiblahC = Get.put(QiblahController());

  late Animation<double>? animation;
  late AnimationController? _animationController;
  double begin = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorSystem.backgroundDarkSecondary,
        body: StreamBuilder<QiblahDirection>(
          stream: FlutterQiblah.qiblahStream,
          builder: (contex, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(
                child: LocationErrorWidget(),
              );
            }

            final qiblahDirection = snapshot.data;

            animation = Tween(
                    begin: begin,
                    end: (qiblahDirection!.qiblah * (pi / 180) * -1))
                .animate(_animationController!);
            begin = (qiblahDirection.qiblah * (pi / 180) * -1);
            _animationController!.forward(from: 0);

            return Stack(
              // fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_compas.png'),
                      fit: BoxFit.fill,
                      opacity: 0.2,
                      scale: 2.0,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${qiblahDirection.direction.toInt()}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: 300,
                          child: AnimatedBuilder(
                            animation: animation!,
                            builder: (BuildContext context, Widget? child) {
                              return Transform.rotate(
                                angle: animation!.value,
                                child: Image.asset(
                                    "assets/images/qiblah_compas_kabah.png"),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          qiblahC.currentAddress.value,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
