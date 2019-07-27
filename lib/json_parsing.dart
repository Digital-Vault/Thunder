import 'dart:convert';

import 'package:flutter_sample/book.dart';

Future<List<Books>> parseBooks(String jsonString) async {
  final parsed = json.decode(jsonString);
  final books = ApiResult.fromJson(parsed).results.books;
  return books;
}
