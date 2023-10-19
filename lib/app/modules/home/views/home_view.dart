import 'package:fltr_alquran_if/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/surah_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Surah>>(
            future: controller.getAllSurah(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(child: Text("Data Empty"));
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Surah surah = snapshot.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text("${surah.number}"),
                      ),
                      title: Text("${surah.englishName}"),
                      subtitle: Text(
                          "${surah.revelationType} | ${surah.numberOfAyahs} Ayat"),
                      trailing: Text(
                        "${surah.name}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  });
            }));
  }
}
