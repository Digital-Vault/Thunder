import 'package:flutter_sample/no_favorites.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    MaterialApp(
      home: Scaffold(),
    );
  });

  testWidgets('Empty favorites smoke test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const NoFavorites(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final text = find.text('Try Liking A book And It Will Show Up Here.');
    expect(text, findsOneWidget);

    final image = find.byType(Image);
    expect(image, findsOneWidget);
  });
}
