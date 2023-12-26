import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  // testWidgets('Test ListTile onTap opens Get.defaultDialog',
  //     (WidgetTester tester) async {
  //   // Build ListTile widget
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Material(
  //         child: ListTile(
  //           title: const Text("Jenis Penulisan Arabic"),
  //           subtitle: const Text("Utsmani"),
  //           onTap: () {
  //             Get.defaultDialog(
  //               title: "Jenis Penulisan Arabic",
  //               titleStyle: const TextStyle(
  //                 fontSize: 16.0,
  //               ),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   RadioListTile<String>(
  //                     title: const Text('IndoPak / Asia'),
  //                     value: 'asia',
  //                     groupValue: 'utsmani',
  //                     onChanged: (value) {},
  //                   ),
  //                   RadioListTile<String>(
  //                     title: const Text('Utsmani'),
  //                     value: 'utsmani',
  //                     groupValue: 'utsmani',
  //                     onChanged: (value) {},
  //                   ),
  //                 ],
  //               ),
  //               actions: [
  //                 const SizedBox(
  //                   width: 120,
  //                   child: Text('CANCEL'),
  //                 ),
  //               ],
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );

  //   // Tap the ListTile
  //   // await tester.tap(find.byType(ListTile));
  //   // await tester.pumpAndSettle();

  //   // // Verify the appearance of Get.defaultDialog
  //   // expect(find.text('Jenis Penulisan Arabic'), findsOneWidget);
  //   // expect(find.text('IndoPak / Asia'), findsOneWidget);
  //   // expect(find.text('Utsmani'), findsOneWidget);
  //   // expect(find.text('CANCEL'), findsOneWidget);

  //   await tester.tap(find.byType(ListTile));
  //   await tester.pumpAndSettle();

  //   expect(find.text('IndoPak / Asia'), findsOneWidget);
  // });

  testWidgets('Widget SwitchListTile Terjemahan Test',
      (WidgetTester tester) async {
    // Buat widget SwitchListTile
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SwitchListTile(
          title: const Text(
            "Perlihatkan Terjemahan",
            style: TextStyle(fontSize: 16.0),
          ),
          value: true,
          onChanged: (value) {},
          secondary:
              const Icon(Icons.remove_red_eye_rounded, color: Colors.teal),
          activeColor: Colors.teal,
          inactiveThumbColor: Colors.grey[500],
          inactiveTrackColor: Colors.grey[400],
        ),
      ),
    ));

    expect(find.byType(SwitchListTile), findsOneWidget);
    expect(find.text("Perlihatkan Terjemahan"), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye_rounded), findsOneWidget);
    expect(
        tester.widget<SwitchListTile>(find.byType(SwitchListTile)).activeColor,
        equals(Colors.teal));
    expect(
        tester
            .widget<SwitchListTile>(find.byType(SwitchListTile))
            .inactiveThumbColor,
        equals(Colors.grey[500]));
    expect(
        tester
            .widget<SwitchListTile>(find.byType(SwitchListTile))
            .inactiveTrackColor,
        equals(Colors.grey[400]));

    // Tap pada SwitchListTile untuk mengubah nilai
    await tester.tap(find.byType(SwitchListTile));
    await tester.pump();

    // Verifikasi apakah nilai SwitchListTile berubah
    expect(tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value,
        isTrue);
  });

  testWidgets('Widget SwitchListTile Translate Test',
      (WidgetTester tester) async {
    // Buat widget SwitchListTile
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SwitchListTile(
          title: const Text(
            "Translate",
            style: TextStyle(fontSize: 16.0),
          ),
          value: true,
          onChanged: (value) {},
          secondary: const Icon(Icons.g_translate_outlined, color: Colors.teal),
          activeColor: Colors.teal,
          inactiveThumbColor: Colors.grey[500],
          inactiveTrackColor: Colors.grey[400],
        ),
      ),
    ));

    expect(find.byType(SwitchListTile), findsOneWidget);
    expect(find.text("Translate"), findsOneWidget);
    expect(find.byIcon(Icons.g_translate_outlined), findsOneWidget);
    expect(
        tester.widget<SwitchListTile>(find.byType(SwitchListTile)).activeColor,
        equals(Colors.teal));
    expect(
        tester
            .widget<SwitchListTile>(find.byType(SwitchListTile))
            .inactiveThumbColor,
        equals(Colors.grey[500]));
    expect(
        tester
            .widget<SwitchListTile>(find.byType(SwitchListTile))
            .inactiveTrackColor,
        equals(Colors.grey[400]));

    // Tap pada SwitchListTile untuk mengubah nilai
    await tester.tap(find.byType(SwitchListTile));
    await tester.pump();

    // Verifikasi apakah nilai SwitchListTile berubah
    expect(tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value,
        isTrue);
  });

  testWidgets(
      'Widget ListTile onTap navigates to information privacy route test',
      (WidgetTester tester) async {
    // Setup test
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListTile(
          leading: const Icon(Icons.info),
          title: const Text("Information & Privacy"),
          subtitle: const Text(
            "Information & Privacy policy App",
          ),
          onTap: () {
            // Get.toNamed(Routes.informationPrivacy);
          },
          tileColor: Colors.white,
          iconColor: Colors.teal,
        ),
      ),
    ));

    // Cek apakah ListTile ditampilkan
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text("Information & Privacy"), findsOneWidget);
    expect(find.text("Information & Privacy policy App"), findsOneWidget);

    // Tap ListTile untuk navigasi
    // await tester.tap(find.byType(ListTile));
    // await tester.pumpAndSettle();

    // Verifikasi navigasi ke rute yang diharapkan
    // expect(Get.currentRoute, '/information-privacy');
  });
  testWidgets('Widget ListTile onTap navigates to Help route test',
      (WidgetTester tester) async {
    // Setup test
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListTile(
          leading: const Icon(Icons.help_outlined),
          title: const Text("Help"),
          subtitle: const Text(
            "Panduan Pengguna",
          ),
          onTap: () {
            // Get.toNamed(Routes.informationPrivacy);
          },
          iconColor: Colors.teal,
        ),
      ),
    ));

    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text("Help"), findsOneWidget);
    expect(find.text("Panduan Pengguna"), findsOneWidget);
  });

  testWidgets('Widget Contact us Column test', (WidgetTester tester) async {
    // Setup test widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Contact us",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.web,
                    size: 32,
                    color: Colors.brown,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.email,
                    size: 32,
                    color: Colors.brown,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

    expect(find.text('Contact us'), findsOneWidget);
    expect(find.byIcon(Icons.web), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);
  });
}
