import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_sample/no_favorites.dart';

import 'api/book.dart';
import 'book_provider.dart';

/// A favorite books page.
///
/// Shows a collection of books the user has favored.
class FavoriteBooks extends StatelessWidget {
  /// Creates a favorite books.
  const FavoriteBooks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookBloc = BookProvider.of(context);

    return StreamBuilder<UnmodifiableListView<Book>>(
      stream: bookBloc.favoriteBooks,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context,
      AsyncSnapshot<UnmodifiableListView<Book>> snapshot) {
    if (!snapshot.hasData) {
      return _buildProgressBar();
    } else if (snapshot.data.isEmpty) {
      return const NoFavorites();
    }

    return _buildListView(context, snapshot.data);
  }

  Widget _buildProgressBar() =>
      const Center(child: CircularProgressIndicator());

  Widget _buildListView(
          BuildContext context, UnmodifiableListView<Book> books) =>
      ListView(
        padding: const EdgeInsets.all(16),
        children: _buildTiles(context, books),
      );

  List<Widget> _buildTiles(
      BuildContext context, UnmodifiableListView<Book> books) {
    final bookBloc = BookProvider.of(context);
    final bookList = <Widget>[];

    for (final book in books) {
      bookList.add(
        Dismissible(
          key: Key(book.primaryIsbn13),
          background: Container(color: Colors.red),
          onDismissed: (direction) {
            bookBloc.toggleFavorite.add(book.primaryIsbn13);

            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('${book.title} dismissed')));
          },
          child: _buildBookTile(book.title, book.author),
        ),
      );
    }

    return bookList;
  }

  Widget _buildBookTile(String title, String author) => ListTile(
        title: Text(title),
        subtitle: Text(author),
        onTap: _onTap,
      );

  void _onTap() {}
}
