import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api/api_result.dart';
import 'api/book.dart';

/// A class fetches the book details.
class BookApiProvider {
  static const _key = 'cGNUdTNGOGVxcUhtck1SZWo4R3pRYkkzM3YzcHdTVEcK';

  /// Fetches all the books in Hardcore Fiction category.
  Future<List<Book>> fetchHardcoreFictionBooks() async {
    final data = await _fetchApiResult();
    final Map<String, dynamic> parsedData = json.decode(data);
    return ApiResult.fromJson(parsedData).results.books;
  }

  Future<String> _fetchApiResult() async {
    final decryptedKey = _decryptKey(_key);

    final url =
        'https://api.nytimes.com/svc/books/v3/lists/hardcover-fiction.json?api-key=$decryptedKey';
    final response = await http.get(url);

    return response.body;
  }

  String _decryptKey(String key) {
    final bytes = base64.decode(key);
    return utf8.decode(bytes);
  }
}
