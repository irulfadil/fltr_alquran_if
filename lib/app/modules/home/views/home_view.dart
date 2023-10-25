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
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bismillahirahmanirahim",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: appFontBrown),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [appFontBrown, appBarGreen],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -50,
                          right: 0,
                          child: Opacity(
                            opacity: 0.5,
                            child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.asset(
                                  "assets/images/mosque.png",
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu_book,
                                    color: appFontWhite,
                                  ),
                                  SizedBox(height: 30.0),
                                  Text(
                                    "Terakhir di baca",
                                    style: TextStyle(
                                      color: appFontWhite,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.0),
                              Text(
                                "Al-fatihah",
                                style: TextStyle(
                                  color: appFontWhite,
                                ),
                              ),
                              Text(
                                "Juz 1 | Ayat 3",
                                style: TextStyle(
                                  color: appFontWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const TabBar(
                indicatorColor: appFontGold,
                unselectedLabelColor: appFontGray,
                labelColor: appFontBrown,
                tabs: [
                  Tab(text: 'SURAH'),
                  Tab(text: 'JUZ'),
                  Tab(text: 'BOOKMARK'),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Center(
                      child: FutureBuilder<List<Surah>>(
                          future: controller.getAllSurah(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      // style: const TextStyle(color: appBarGreen),
                                    ),
                                  ),
                                  title: Text(
                                    "${surah.englishName}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                    // style: const TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(
                                      "${surah.revelationType} | ${surah.numberOfAyahs} Ayat",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  trailing: Text(
                                    "${surah.name}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                );
                              },
                            );
                          })),
                  const Center(
                    child: Text("Page 2"),
                  ),
                  const Center(
                    child: Text("Page 3"),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
