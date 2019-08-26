import 'dart:collection';

import 'package:flutter_sample/no_favorites.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/api/book.dart';
import 'package:flutter_sample/book_bloc.dart';
import 'package:flutter_sample/book_provider.dart';
import 'package:flutter_sample/favorite_books.dart';
import 'package:flutter_test/flutter_test.dart';

class MockBloc extends Mock implements BookBloc {}

void main() {
  Widget widget;
  MockBloc mockBloc;

  setUp(() {
    mockBloc = MockBloc();
    widget = BookProvider(
      bookBloc: mockBloc,
      child: MaterialApp(
        home: Scaffold(
          body: const FavoriteBooks(),
        ),
      ),
    );
  });
  testWidgets('Progress bar indicator on initial launch', (tester) async {
    await tester.pumpWidget(
      widget,
    );

    final progressBarFinder = find.byType(CircularProgressIndicator);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Empty favorites smoke test', (tester) async {
    when(mockBloc.favoriteBooks).thenAnswer(
      (_) => Stream<UnmodifiableListView<Book>>.fromIterable(
        [Book()].map(
          (f) => UnmodifiableListView([]),
        ),
      ),
    );

    await tester.pumpWidget(
      widget,
    );

    await tester.pumpAndSettle();

    final noFavoritesFinder = find.byType(NoFavorites);
    expect(noFavoritesFinder, findsOneWidget);
  });

  testWidgets('One favorite book smoke test', (tester) async {
    const title = 'title';
    const author = 'author';

    when(mockBloc.favoriteBooks).thenAnswer(
      (_) => Stream<UnmodifiableListView<Book>>.fromIterable(
        [Book(title: '$title', author: '$author')].map(
          (f) => UnmodifiableListView([f]),
        ),
      ),
    );

    await tester.pumpWidget(
      widget,
    );

    await tester.pumpAndSettle();

    final listTitleFinder = find.byType(ListTile);
    expect(listTitleFinder, findsOneWidget);

    final titleFinder = find.text('$title');
    expect(titleFinder, findsOneWidget);

    final authorFinder = find.text('$author');
    expect(authorFinder, findsOneWidget);
  });

  testWidgets('Multiple favorite books smoke test', (tester) async {
    when(mockBloc.favoriteBooks).thenAnswer(
      (_) => Stream<UnmodifiableListView<Book>>.fromIterable(
        [1].map(
          (_) => UnmodifiableListView([
            Book(title: 'title1', author: 'author1'),
            Book(title: 'title2', author: 'author2'),
          ]),
        ),
      ),
    );

    await tester.pumpWidget(
      widget,
    );

    await tester.pumpAndSettle();

    final listTitleFinder = find.byType(ListTile);
    expect(listTitleFinder, findsNWidgets(2));
  });
}
