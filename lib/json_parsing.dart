import 'dart:convert';

import 'package:flutter_sample/book.dart';

Book parseBook(String jsonString) {
  final parsed = json.decode(jsonString);
  return Book.fromJson(parsed);
}
