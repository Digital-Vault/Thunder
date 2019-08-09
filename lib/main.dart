import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'api/book.dart';
import 'book_provider.dart';

void main() => runApp(BookProvider(child: ShoppingCartApp()));

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

  Widget _buildCard(Book book) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: _buildCardColumn(book),
      );

  Widget _buildCardColumn(Book book) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImage(book),
          _buildPadding(book),
          _buildButtons(),
        ],
      );

  Widget _buildImage(Book book) => Image.network(book.bookImage);

  Widget _buildPadding(Book book) => Padding(
        padding: const EdgeInsets.all(17),
        child: _buildTitleAndDescription(book),
      );

  Widget _buildTitleAndDescription(Book book) => ListTile(
        title: Text(book.title),
        subtitle: Text(book.description),
      );

  Widget _buildButtons() => ButtonTheme.bar(
          child: ButtonBar(
        children: [
          _buildBuyButton(),
          _buildFavoriteButton(),
        ],
      ));

  Widget _buildBuyButton() => FlatButton(
        onPressed: () {},
        child: const Text('Buy book'),
      );

  Widget _buildFavoriteButton() => IconButton(
        icon: Icon(EvaIcons.heart),
        onPressed: () {},
      );
}
