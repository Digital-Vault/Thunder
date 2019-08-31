import 'package:flutter/material.dart';
import 'package:flutter_sample/login_header.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Icon and Text smoke test', (tester) async {
    final widget = MaterialApp(
      home: Scaffold(
        body: const LoginHeader(),
      ),
    );
    await tester.pumpWidget(widget);

    final iconFinder = find.byIcon(Icons.library_books);
    expect(iconFinder, findsOneWidget);

    final textFinder = find.text('The Library');
    expect(textFinder, findsOneWidget);
  });
}
