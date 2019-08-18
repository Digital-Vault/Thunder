import 'dart:collection';
import 'package:flutter/material.dart';

import 'api/book.dart';
import 'book_card.dart';
import 'book_provider.dart';

import 'login_page.dart';

/// Height of the book cover image from NY Times API
const double bookCoverHeight = 495;

/// Width of the book cover image from NY Times API
const double bookCoverWidth = 328;

void main() => runApp(LoginPage());
//void main() => runApp(BookProvider(child: ShoppingCartApp()));

/// Main widget
class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Shopping Cart',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Book Store'),
          ),
          body: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) {
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
