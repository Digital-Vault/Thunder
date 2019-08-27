import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api/book.dart';

/// Detail Page that displays information on the book
class DetailPage extends StatelessWidget {
  /// Creates a Detail Page and ensures book is not null
  const DetailPage({@required this.book})
      : assert(book != null, 'book cannot be null');

  /// The book being displayed
  final Book book;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar(book),
        body: _list(),
      );

  Widget _appBar(Book book) => AppBar(title: Text(book.title), actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite),
        )
      ]);

  Widget _list() => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildBookCover(),
          _buildBookTitle(),
          _buildBookDescription(),
          _buildBuyButton()
        ],
      );

  Widget _buildBookCover() => FadeInImage.memoryNetwork(
        fit: BoxFit.cover,
        placeholder: kTransparentImage,
        image: book.bookImage,
      );

  Widget _buildBookTitle() => ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(book.title),
        subtitle: Text(book.author),
      );

  Widget _buildBookDescription() => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(book.description),
      );

  Widget _buildBuyButton() => ButtonTheme(
        child: RaisedButton(
          onPressed: _launchUrl,
          child: const Text('Buy Now'),
        ),
      );

  Future<void> _launchUrl() async {
    if (await canLaunch(book.amazonProductUrl)) {
      await launch(book.amazonProductUrl);
    } else {
      throw ArgumentError('Could not launch $book.amazonProductUrl');
    }
  }
}
