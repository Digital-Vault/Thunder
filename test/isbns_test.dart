import 'dart:convert';

import 'package:flutter_sample/api/isbns.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create a ISBN directly', () {
    const isbn10 = '0062834835';
    const isbn13 = '9780062834836';
    const isbn = Isbns(isbn10: isbn10, isbn13: isbn13);

    expect(isbn.isbn10, isbn10);
    expect(isbn.isbn13, isbn13);
  });

  test('Create a ISBN from json', () {
    const isbn10 = '0062834835';
    const isbn13 = '9780062834836';
    const jsonData = '{"isbn10": "$isbn10","isbn13": "$isbn13"}';
    final Map<String, dynamic> jsonParsed = json.decode(jsonData);
    final isbn = Isbns.fromJson(jsonParsed);

    expect(isbn.isbn10, isbn10);
    expect(isbn.isbn13, isbn13);
  });
}
