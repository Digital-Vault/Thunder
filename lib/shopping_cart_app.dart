import 'dart:collection';

import 'package:flutter/material.dart';

import 'api/book.dart';
import 'book_card.dart';
import 'book_provider.dart';

/// Main widget
class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookBloc = BookProvider.of(context);
    return StreamBuilder<UnmodifiableListView<Book>>(
      stream: bookBloc.books,
      builder: _blocBuilder,
    );
  }

  Widget _blocBuilder(BuildContext context,
      AsyncSnapshot<UnmodifiableListView<Book>> snapshot) {
    if (!snapshot.hasData) return _buildProgressBar();

    return _buildListView(snapshot.data);
  }

  Widget _buildProgressBar() =>
      Center(child: const CircularProgressIndicator());

  Widget _buildListView(UnmodifiableListView<Book> books) => ListView(
        padding: const EdgeInsets.all(32),
        children: books.map(_buildCard).toList(),
      );

  Widget _buildCard(Book book) => BookCard(book: book);
}
