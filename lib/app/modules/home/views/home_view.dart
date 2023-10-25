import 'package:fltr_alquran_if/app/modules/home/controllers/home_controller.dart';
import 'package:fltr_alquran_if/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../../data/models/surah_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Al Qur'an"),
          centerTitle: true,
          actions: [
            CustomIconButton(
              onPressed: () => Get.toNamed(Routes.search),
              icon: Icons.search,
              onTap: () {},
            ),
            CustomIconButton(
              onPressed: () {},
              icon: Icons.more_vert,
              onTap: () {},
            ),
          ],
          // bottom: const TabBar(
          //   indicatorWeight: 3,
          //   labelStyle: TextStyle(fontWeight: FontWeight.bold),
          //   splashFactory: NoSplash.splashFactory,
          //   tabs: [
          //     Tab(text: 'SURAH'),
          //     Tab(text: 'JUZ'),
          //     Tab(text: 'BOOKMARK'),
          //   ],
          // ),
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
                        backgroundColor: appFontBrown,
                        child: Text(
                          "${surah.number}",
                          style: Theme.of(context).textTheme.titleSmall,
                          // style: const TextStyle(color: appBarGreen),
                        ),
                      ),
                      title: Text(
                        "${surah.englishName}",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                        // style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                          "${surah.revelationType} | ${surah.numberOfAyahs} Ayat",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Text(
                        "${surah.name}",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    );
                  });
            }));
  }
}
