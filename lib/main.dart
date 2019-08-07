import 'dart:collection';
import 'package:flutter/material.dart';
import 'api/book.dart';
import 'book_provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

//executing function
void main() => (runApp(BookProvider(child: ShoppingCartApp())));

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Book Store'),
        ),
        body: _buildBody(context),
      ),
    );
  }

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

  Widget _buildProgressBar() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildListView(UnmodifiableListView<Book> books) {
    return ListView(
      padding: const EdgeInsets.all(32.0),
      children: books.map(_buildCard).toList(),
    );
  }

  Widget _buildCard(Book book) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10),
      child: _builCardColumn(book),
    );
  }

  Widget _builCardColumn(Book book) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildImage(book),
        _buildPadding(book),
        _buildButtons(),
      ],
    );
  }

  Widget _buildImage(Book book) {
    return Image.network(book.bookImage);
  }

  Widget _buildPadding(Book book) {
    return Padding(
      padding: EdgeInsets.all(17),
      child: _buildTitleAndDescription(book),
    );
  }

  Widget _buildTitleAndDescription(Book book) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text(book.description),
    );
  }

  Widget _buildButtons() {
    return ButtonTheme.bar(
        child: ButtonBar(
      children: [
        _buildBuyButton(),
        _buildFavouriteButton(),
      ],
    ));
  }

  Widget _buildBuyButton() {
    return FlatButton(
      child: const Text("Buy book"),
      onPressed: () {},
    );
  }

  Widget _buildFavouriteButton() {
    return IconButton(
      icon: Icon(EvaIcons.heart),
      onPressed: () {},
    );
  }
}
