import 'dart:collection';
import 'package:flutter/material.dart';
import 'api/book.dart';
import 'book_provider.dart';

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
      children: books.map(_buildRow).toList(),
    );
  }

  Widget _buildRow(Book book) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: Text(book.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ),
          Expanded(
            child: Text("\$ " + book.price.toString(),
                textAlign: TextAlign.right,
                style: new TextStyle(fontSize: 20.0, color: Colors.black)),
          ),
        ]));
  }
}
