import 'dart:async';
import 'dart:collection';

import 'package:rxdart/subjects.dart';

import 'api/book.dart';
import 'book_api_provider.dart';

/// This is the business logic component that handles all business
/// logic about books.
class BookBloc {
  /// Creates a bloc and fetches the data.
  BookBloc() {
    _provider.fetchHardcoreFictionBooks().then(_addBooks);

    _favoriteToggleController.stream.listen(_toggleFavorite);

    _updateFavoriteBooksStream();
  }

  final _provider = BookApiProvider();
  final _books = <String, Book>{};

  final _booksSubject = BehaviorSubject<UnmodifiableListView<Book>>();
  final _favoriteBooksSubject = BehaviorSubject<UnmodifiableListView<Book>>();
  final _favoriteToggleController = StreamController<String>();

  /// All books.
  Stream<UnmodifiableListView<Book>> get books => _booksSubject.stream;

  /// All favorite books.
  Stream<UnmodifiableListView<Book>> get favoriteBooks =>
      _favoriteBooksSubject.stream;

  /// The toggle favorite sink.
  Sink<String> get toggleFavorite => _favoriteToggleController.sink;

  void _addBooks(List<Book> books) {
    for (final book in books) {
      _books[book.primaryIsbn13] = book;
    }

    _updateBooksStream();
  }

  void _updateBooksStream() {
    _booksSubject.add(UnmodifiableListView(_books.values));
  }

  void _toggleFavorite(String isbn13) {
    final book = _books[isbn13];
    book.favorite = !book.favorite;

    _updateBooksStream();
    _updateFavoriteBooksStream();
  }

  void _updateFavoriteBooksStream() {
    final favorites = _getFavoriteBooks();
    _favoriteBooksSubject.add(UnmodifiableListView(favorites));
  }

  List<Book> _getFavoriteBooks() {
    final favorites = <Book>[];

    for (final book in _books.values) {
      if (book.favorite) {
        favorites.add(book);
      }
    }

    return favorites;
  }

  /// Closes all the Sinks and Streams.
  void dispose() {
    _booksSubject.close();
    _favoriteBooksSubject.close();
    _favoriteToggleController.close();
  }
}
