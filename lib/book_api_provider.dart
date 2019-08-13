import 'dart:convert';

import 'package:flutter/services.dart';

import 'api/api_result.dart';
import 'api/book.dart';

/// A class fetches the book details.
class BookApiProvider {
  Future<String> _fetchApiResult() async =>
      rootBundle.loadString('assets/test.json');

  /// Fetches all the books in Hardcore Fiction category.
  Future<List<Book>> fetchHardcoreFictionBooks() async {
    final data = await _fetchApiResult();
    final Map<String, dynamic> parsedData = json.decode(data);
    return ApiResult.fromJson(parsedData).results.books;
  }
}
