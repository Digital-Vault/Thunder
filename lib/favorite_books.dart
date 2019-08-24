import 'dart:collection';

import 'package:flutter/material.dart';

import 'api/book.dart';
import 'book_provider.dart';

/// A favorite books page.
///
/// Shows a collection of books the user has favored.
class FavoriteBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookBloc = BookProvider.of(context);

    return StreamBuilder<UnmodifiableListView<Book>>(
      stream: bookBloc.favoriteBooks,
      builder: _blocBuilder,
    );
  }

  Widget _blocBuilder(BuildContext context,
      AsyncSnapshot<UnmodifiableListView<Book>> snapshot) {
    if (!snapshot.hasData) {
      return _buildProgressBar();
    } else if (snapshot.data.isEmpty) {
      return _emptyFavorites();
    }

    return _buildListView(snapshot.data);
  }

  Widget _buildProgressBar() =>
      const Center(child: CircularProgressIndicator());

  Widget _emptyFavorites() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: _mainColumn(),
      );

  Widget _mainColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_emptyFavoriteImage(), _emptyFavoriteText()],
      );

  Widget _emptyFavoriteImage() => Image.asset(
        'assets/girl_like.png',
        scale: 4,
        fit: BoxFit.cover,
      );

  Widget _emptyFavoriteText() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text('Try Liking A book And It Will Show Up Here.'),
        ),
      );

  Widget _buildListView(UnmodifiableListView<Book> books) => ListView(
        padding: const EdgeInsets.all(16),
        children: books.map(_buildTitle).toList(),
      );

  Widget _buildTitle(Book book) => ListTile(
        title: Text(book.title),
        subtitle: Text(book.author),
        onTap: _onTap,
      );

  void _onTap() {}
}
