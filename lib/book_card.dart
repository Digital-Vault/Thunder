import 'package:flutter/material.dart';
import 'package:flutter_sample/book_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import 'api/book.dart';
import 'book_provider.dart';
import 'detail_page.dart';

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
  Widget build(BuildContext context) {
    final bookBloc = BookProvider.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: _buildCardColumn(context, bookBloc),
    );
  }

  Widget _buildCardColumn(BuildContext context, BookBloc bookBloc) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImage(),
          _buildPadding(),
          _buildButtons(context, bookBloc),
        ],
      );

  Widget _buildImage() => FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: book.bookImage,
        height: bookCoverHeight,
        width: bookCoverWidth,
      );

  Widget _buildPadding() => Padding(
        padding: const EdgeInsets.all(17),
        child: _buildTitleAndDescription(),
      );

  Widget _buildTitleAndDescription() => ListTile(
        title: Text(book.title),
        subtitle: Text(book.description),
      );

  Widget _buildButtons(BuildContext context, BookBloc bookBloc) =>
      ButtonTheme.bar(
          child: ButtonBar(
        children: [
          _buildBuyButton(context),
          _buildFavoriteButton(bookBloc),
        ],
      ));

  Widget _buildBuyButton(BuildContext context) => FlatButton(
        onPressed: () {
          _loadDetailPage(context, book);
        },
        child: const Text('Buy book'),
      );

  void _loadDetailPage(BuildContext context, Book book) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => DetailPage(
            book: book,
          ),
        ));
  }

  Widget _buildFavoriteButton(BookBloc bookBloc) => IconButton(
        icon: Icon(book.favorite ? Icons.favorite : Icons.favorite_border,
            color: book.favorite ? Colors.red : Colors.black),
        onPressed: () {
          bookBloc.toggleFavorite.add(book.primaryIsbn13);
        },
      );
}
