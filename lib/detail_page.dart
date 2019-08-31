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
        appBar: _appBar(context),
        body: _list(),
      );

  Widget _appBar(BuildContext context) => AppBar(
        title: Text(book.title),
        actions: [
          _buildFavoriteIcon(),
        ],
      );

  Widget _buildFavoriteIcon() {
    Icon icon;
    if (book.favorite) {
      icon = Icon(
        Icons.favorite,
        color: Colors.red,
      );
    } else {
      icon = Icon(Icons.favorite_border);
    }

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: icon,
    );
  }

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

  Widget _buildBuyButton() => RaisedButton(
        onPressed: _launchUrl,
        child: const Text('Buy Now'),
      );

  Future<void> _launchUrl() async {
    if (await canLaunch(book.amazonProductUrl)) {
      await launch(book.amazonProductUrl);
    } else {
      throw ArgumentError('Could not launch $book.amazonProductUrl');
    }
  }
}
