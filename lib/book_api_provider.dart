import 'dart:convert';

import 'package:flutter/services.dart';

import 'api/api_result.dart';
import 'api/book.dart';


class BookApiProvider {
  Future<String> fetchApiResult() async {
    return rootBundle.loadString('assets/test.json');
  }

  Future<List<Book>> fetchHardcoreFictionBooks() async {
    var data = await fetchApiResult();
    var parsedData = json.decode(data);
    return ApiResult.fromJson(parsedData).results.books;
  }
}
