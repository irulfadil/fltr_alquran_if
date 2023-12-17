import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'widget_location_error.dart';
// import 'package:geocoding/geocoding.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? _animationController;
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
    FlutterQiblah().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            // ignore: avoid_print
            print(
                "qiblah: ${qiblahDirection!.qiblah} + direction: ${qiblahDirection.direction} + offset: ${qiblahDirection.offset}");
            animation = Tween(
                    begin: begin,
                    end: (qiblahDirection.qiblah * (pi / 180) * -1))
                .animate(_animationController!);
            begin = (qiblahDirection.qiblah * (pi / 180) * -1);
            _animationController!.forward(from: 0);

            // Get name qiblah direction
            // final latitude = double.parse(_latitudeController.text);
            //       final longitude = double.parse(_longitudeController.text);
            // final List<Placemark> placemarks =
            //     placemarkFromCoordinates(latitude, longitude);

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${qiblahDirection.direction.toInt()}",
                    // placemarks.isNotEmpty ? placemarks[0].name:"",
                    style: Theme.of(context).textTheme.titleLarge,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
