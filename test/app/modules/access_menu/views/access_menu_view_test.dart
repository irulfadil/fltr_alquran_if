import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

// Mock class untuk mock Navigator
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockGet extends Mock implements GetInterface {}

void main() {
  setUp(() {
    Get.testMode = true; 
  });

  group('Group Display Container backgroud, logo, logo_2', () {
    testWidgets('Widget Container with BackdropFilter Test',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_access_menu.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: const Center(),
          ),
        )),
      );

      // Verify if Container with BackdropFilter is present
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(BackdropFilter), findsOneWidget);

      // Verify if DecorationImage is applied to the Container
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      final BoxDecoration? decoration =
          containerWidget.decoration as BoxDecoration?;
      expect(decoration?.image, isA<DecorationImage>());

      // Verify if BackdropFilter has ImageFilter.blur applied
      final backdropFilterFinder = find.byType(BackdropFilter);
      final backdropFilterWidget =
          tester.widget<BackdropFilter>(backdropFilterFinder);
      expect(backdropFilterWidget.filter, isA<ImageFilter>());
    });

    testWidgets('Container show decoration background test',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_access_menu.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);

      final BoxDecoration? decoration = (tester
          .widget<Container>(find.byType(Container))
          .decoration) as BoxDecoration?;
      final DecorationImage? imageDecoration = decoration?.image;
      expect(imageDecoration?.image, isA<AssetImage>());
      expect(imageDecoration?.fit, BoxFit.cover);
    });

    testWidgets('Container show widget image logo test',
        (WidgetTester tester) async {
      // Build our Container widget and trigger a frame
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/light-logo-alquran-green.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );

      // Verify that the Container has been rendered
      expect(find.byType(Container), findsOneWidget);

      // Verify the width and height of the Container
      expect(tester.getSize(find.byType(Container)), const Size(50, 50));

      // Verify the BoxDecoration properties
      final BoxDecoration? decoration = (tester
          .widget<Container>(find.byType(Container))
          .decoration) as BoxDecoration?;
      final DecorationImage? image = decoration?.image;
      expect(image?.image, isA<AssetImage>());
      expect(image?.fit, BoxFit.cover);
    });

    testWidgets('Container show widget image list number test',
        (WidgetTester tester) async {
      // Build our Container widget and trigger a frame
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/light-list-numb-surah-4pt.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );

      // Verify that the Container has been rendered
      expect(find.byType(Container), findsOneWidget);

      // Verify the width and height of the Container
      expect(tester.getSize(find.byType(Container)), const Size(80, 80));

      // Verify the BoxDecoration properties
      final BoxDecoration? decoration = (tester
          .widget<Container>(find.byType(Container))
          .decoration) as BoxDecoration?;
      final DecorationImage? image = decoration?.image;
      expect(image?.image, isA<AssetImage>());
      expect(image?.fit, BoxFit.cover);
    });
  });

  group(
      "Group Display Container button read, lastread, bookmark, search, setting test",
      () {
    testWidgets('Container button Read AlQuran properties test',
        (WidgetTester tester) async {
      // Build our Container widget and trigger a frame
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Container(
              width: 800,
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.30),
                    Colors.green.withOpacity(0.5),
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  "Read AlQur'an",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Verify that the Container has been rendered
      expect(find.byType(Container), findsOneWidget);

      // Verify the width and height of the Container
      final Finder containerFinder = find.byType(Container);
      final double containerWidth = tester.getSize(containerFinder).width;
      final double containerHeight = tester.getSize(containerFinder).height;
      expect(containerWidth, 800);
      expect(containerHeight, 600);

      // Verify the BoxDecoration properties
      final Container containerWidget =
          tester.widget<Container>(containerFinder);
      final BoxDecoration? decoration =
          containerWidget.decoration as BoxDecoration?;
      expect(decoration?.border, isA<Border>());
      // Add your specific border properties check here

      final Gradient? gradient = decoration?.gradient as LinearGradient?;
      expect(gradient?.colors, [
        Colors.white.withOpacity(0.30),
        Colors.green.withOpacity(0.5),
      ]);

      // Verify the child widget properties
      final Finder textFinder = find.text("Read AlQur'an");
      final Text textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.color, Colors.white);
      expect(textWidget.style?.fontSize, 16.0);
    });

    testWidgets('Container button Last Read properties test',
        (WidgetTester tester) async {
      // Build Container widget
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.30),
                    Colors.green.withOpacity(0.5),
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  "Last Read",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Verify the existence of the Container widget
      expect(find.byType(Container), findsOneWidget);

      // Verify the width and height of the Container
      final Finder containerFinder = find.byType(Container);
      final container = tester.widget<Container>(containerFinder);

      final double containerWidth = tester.getSize(containerFinder).width;
      final double containerHeight = tester.getSize(containerFinder).height;
      expect(containerWidth, 800);
      expect(containerHeight, 600);

      // Verify the BoxDecoration properties
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.borderRadius, BorderRadius.circular(20));
      expect(boxDecoration.border, isA<Border>());
      expect(boxDecoration.gradient, isA<LinearGradient>());

      // Verify the existence of the Text widget
      expect(find.text('Last Read'), findsOneWidget);

      // Verify the style of the Text widget
      final textFinder = find.text('Last Read');
      final textWidget = tester.widget<Text>(textFinder);

      expect(textWidget.style?.color, Colors.white);
      expect(textWidget.style?.fontSize, 16.0);
    });

    testWidgets("Container button Bookmark properties test",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.15),
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  "Bookmark",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Verify the existence of the Container widget
      expect(find.byType(Container), findsOneWidget);

      // Verify the width and height of the Container
      final Finder containerFinder = find.byType(Container);
      final container = tester.widget<Container>(containerFinder);

      final double containerWidth = tester.getSize(containerFinder).width;
      final double containerHeight = tester.getSize(containerFinder).height;
      expect(containerWidth, 800);
      expect(containerHeight, 600);

      // Verify the BoxDecoration properties
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.borderRadius, BorderRadius.circular(20));
      expect(boxDecoration.border, isA<Border>());
      expect(boxDecoration.gradient, isA<LinearGradient>());

      // Verify the existence of the Text widget
      expect(find.text('Bookmark'), findsOneWidget);

      // Verify the style of the Text widget
      final textFinder = find.text('Bookmark');
      final textWidget = tester.widget<Text>(textFinder);

      expect(textWidget.style?.color, Colors.white);
      expect(textWidget.style?.fontSize, 16.0);
    });

    testWidgets("Container button Search properties test",
        (WidgetTester tester) async {
      // Build Container widget
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.30),
                    Colors.amber.withOpacity(
                        0.15), // Changed to ColorSystem.appColorGold
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.white, // Changed to ColorSystem.appColorWhite
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Verify the existence of the Container widget
      expect(find.byType(Container), findsOneWidget);

      // Verify the width and height of the Container
      final containerFinder = find.byType(Container);
      final container = tester.widget<Container>(containerFinder);

      final double containerWidth = tester.getSize(containerFinder).width;
      final double containerHeight = tester.getSize(containerFinder).height;
      expect(containerWidth, 800);
      expect(containerHeight, 600);

      // Verify the BoxDecoration properties
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.borderRadius, BorderRadius.circular(20));
      expect(boxDecoration.border, isA<Border>());
      expect(boxDecoration.gradient, isA<LinearGradient>());

      // Verify the existence of the Text widget
      expect(find.text('Search'), findsOneWidget);

      // Verify the style of the Text widget
      final textFinder = find.text('Search');
      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.color, Colors.white);
      expect(textWidget.style?.fontSize, 16.0);
    });

    testWidgets("Container button Setting properties test",
        (WidgetTester tester) async {
      // Build Container widget
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.30),
                    Colors.amber.withOpacity(
                        0.15), // Changed to ColorSystem.appColorGold
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  "Setting",
                  style: TextStyle(
                    color: Colors.white, // Changed to ColorSystem.appColorWhite
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Verify the existence of the Container widget
      expect(find.byType(Container), findsOneWidget);

      // Verify the width and height of the Container
      final containerFinder = find.byType(Container);
      final container = tester.widget<Container>(containerFinder);

      final double containerWidth = tester.getSize(containerFinder).width;
      final double containerHeight = tester.getSize(containerFinder).height;
      expect(containerWidth, 800);
      expect(containerHeight, 600);

      // Verify the BoxDecoration properties
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.borderRadius, BorderRadius.circular(20));
      expect(boxDecoration.border, isA<Border>());
      expect(boxDecoration.gradient, isA<LinearGradient>());

      // Verify the existence of the Text widget
      expect(find.text('Setting'), findsOneWidget);

      // Verify the style of the Text widget
      final textFinder = find.text('Setting');
      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.color, Colors.white);
      expect(textWidget.style?.fontSize, 16.0);
    });
  });

  testWidgets('Center Widget with CircularProgressIndicator test',
      (WidgetTester tester) async {
    // Build Center widget with CircularProgressIndicator
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    // Verify the existence of the Center widget
    expect(find.byType(Center), findsOneWidget);

    // Verify the existence of the CircularProgressIndicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
