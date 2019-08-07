import 'dart:async';
import 'dart:collection';

import 'package:rxdart/subjects.dart';

import 'api/book.dart';
import 'book_api_provider.dart';

/// This is the business logic component that handles all business
/// logic about books.
class BookBloc {
  final _provider = BookApiProvider();
  final _booksSubject = BehaviorSubject<UnmodifiableListView<Book>>();
  var _books = <Book>[];

  BookBloc() {
    _updateBooks().then((_) {
      _booksSubject.add(UnmodifiableListView(_books));
    });
  }

  Stream<UnmodifiableListView<Book>> get books => _booksSubject.stream;

  Future<List<Book>> _updateBooks() async {
    final books = await _provider.fetchHardcoreFictionBooks();
    _books = books;
    return books;
  }

  void dispose() {
    _booksSubject.close();
  }
}
