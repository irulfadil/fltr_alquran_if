import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../utils/color_system.dart';
import '../../../../widgets/widget_location_error.dart';
import '../controllers/qiblah_controller.dart';

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
    qiblahC.initLocationAndAddress();
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
              return Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: const Center(
                  child: SizedBox(
                    width: 35.0,
                    height: 35.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          ColorSystem.appColorTeal),
                      strokeWidth: 5.0,
                    ),
                  ),
                ),
              );
            }

            if (snapshot.hasError) {
              return const LocationErrorWidget();
            }

            final qiblahDirection = snapshot.data;

            animation = Tween(
                    begin: begin,
                    end: (qiblahDirection!.qiblah * (pi / 180) * -1))
                .animate(_animationController!);
            begin = (qiblahDirection.qiblah * (pi / 180) * -1);
            _animationController!.forward(from: 0);

            return Obx(
              () {
                // Current koordinat
                double? latitude = qiblahC.currentLocation.value?.latitude;
                double? longitude = qiblahC.currentLocation.value?.longitude;

                if (latitude != null && longitude != null) {
                  latitude = qiblahC.currentLocation.value?.latitude;
                  longitude = qiblahC.currentLocation.value?.longitude;
                } else {
                  latitude = 0;
                  longitude = 0;
                }

                // Koorinat Latitude/longitude Ka'bah Mecca
                double mekahLatitude = 21.422487;
                double mekahLongitude = 39.826206;

                // Distance KM from the location point to the Kaaba in Mecca
                double distanceInMeters = Geolocator.distanceBetween(
                  latitude!,
                  longitude!,
                  mekahLatitude,
                  mekahLongitude,
                );

                double distanceInKilometers = distanceInMeters / 1000;

                // Distance  latitude nord from the location point to the Kaaba in Mecca
                double bearing = Geolocator.bearingBetween(
                  latitude,
                  longitude,
                  mekahLatitude,
                  mekahLongitude,
                );

                double northDirection = (bearing + 360) % 360;

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
                            Icon(
                              Icons.location_pin,
                              color: Colors.red[700],
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              qiblahC.currentAddress.value.isNotEmpty
                                  ? qiblahC.currentAddress.value
                                  : "loading location...",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 10.0),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  const TextSpan(
                                    text: "Qiblah ",
                                  ),
                                  TextSpan(
                                    style: TextStyle(color: Colors.amber[700]),
                                    text: "${northDirection.toInt()}\u00B0 ",
                                  ),
                                  const TextSpan(
                                    text: "dari Utara",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  const TextSpan(
                                    text: "Jarak ke Ka'bah ",
                                  ),
                                  TextSpan(
                                    style: TextStyle(color: Colors.amber[700]),
                                    text: "${distanceInKilometers.toInt()} KM",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  children: [
                                    const Icon(Icons.info, color: Colors.grey),
                                    const SizedBox(width: 5.0),
                                    Expanded(
                                      child: Text(
                                        "Jauhkan perangkat Anda dari objek yang berbahan besi atau logam, agar lebih akurat.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
