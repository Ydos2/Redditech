// This is a basic Flutter widget test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:redditech/main.dart';
import 'package:redditech/home_page.dart';

void main() {
  group('Widget', () {
    testWidgets('Tests widget text', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const WelcomeScreen());

      expect(find.text('Redditech'), findsOneWidget);
      expect(find.text('Share, Create and Play'), findsOneWidget);
      expect(find.text('LOGIN'), findsOneWidget);
      //expect(find.text('Login'), findsNothing);
    });

    testWidgets('Tests widget icons', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      //await tester.pumpWidget(const MyApp());

      /*expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.add_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.account_circle), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);*/
      //expect(find.text('Login'), findsNothing);
    });

    /*test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });*/
  });
}
