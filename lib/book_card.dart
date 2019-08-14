import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

import 'api/book.dart';

/// Height of the book cover image from NY Times API
const double bookCoverHeight = 495;

/// Width of the book cover image from NY Times API
const double bookCoverWidth = 328;

/// A Book Card based on the material design card.
class BookCard extends StatelessWidget {
  /// Creates a book card.
  ///
  /// The [book] must not be null.
  const BookCard({@required this.book})
      : assert(book != null, 'book cannot be null');

  /// The Card being displayed
  final Book book;

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: _buildCardColumn(book),
      );
}

Widget _buildCardColumn(Book book) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildImage(book),
        _buildPadding(book),
        _buildButtons(),
      ],
    );

Widget _buildImage(Book book) => FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: book.bookImage,
      height: bookCoverHeight,
      width: bookCoverWidth,
    );

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
