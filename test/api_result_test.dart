import 'dart:convert';
import 'dart:io';

import 'package:flutter_sample/api/book.dart';
import 'package:flutter_sample/api/results.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create Result using constructor', () {
    const listName = 'Hardcover Fiction';
    const listNameEncoded = 'hardcover-fiction';
    const bestsellersDate = '2019-07-20';
    const publishedDate = '2019-08-04';
    const publishedDateDescription = 'latest';
    const nextPublishedDate = '';
    const previousPublishedDate = '2019-07-28';
    const displayName = 'Hardcover Fiction';
    const normalListEndsAt = 15;
    const updated = 'WEEKLY';
    const books = <Book>[];

    const results = Results(
      listName: listName,
      listNameEncoded: listNameEncoded,
      bestsellersDate: bestsellersDate,
      publishedDate: publishedDate,
      publishedDateDescription: publishedDateDescription,
      nextPublishedDate: nextPublishedDate,
      previousPublishedDate: previousPublishedDate,
      displayName: displayName,
      normalListEndsAt: normalListEndsAt,
      updated: updated,
      books: books,
    );

    expect(results.listName, listName);
    expect(results.listNameEncoded, listNameEncoded);
    expect(results.bestsellersDate, bestsellersDate);
    expect(results.publishedDate, publishedDate);
    expect(results.publishedDateDescription, publishedDateDescription);
    expect(results.nextPublishedDate, nextPublishedDate);
    expect(results.previousPublishedDate, previousPublishedDate);
    expect(results.displayName, displayName);
    expect(results.normalListEndsAt, normalListEndsAt);
    expect(results.updated, updated);
    expect(results.books.isEmpty, true);
  });

  test('Create Results from json', () async {
    const listName = 'Hardcover Fiction';
    const listNameEncoded = 'hardcover-fiction';
    const bestsellersDate = '2019-07-20';
    const publishedDate = '2019-08-04';
    const publishedDateDescription = 'latest';
    const nextPublishedDate = '';
    const previousPublishedDate = '2019-07-28';
    const displayName = 'Hardcover Fiction';
    const normalListEndsAt = 15;
    const updated = 'WEEKLY';

    final resultJson = await _getResultFromTestJson();
    final results = Results.fromJson(resultJson);

    expect(results.listName, listName);
    expect(results.listNameEncoded, listNameEncoded);
    expect(results.bestsellersDate, bestsellersDate);
    expect(results.publishedDate, publishedDate);
    expect(results.publishedDateDescription, publishedDateDescription);
    expect(results.nextPublishedDate, nextPublishedDate);
    expect(results.previousPublishedDate, previousPublishedDate);
    expect(results.displayName, displayName);
    expect(results.normalListEndsAt, normalListEndsAt);
    expect(results.updated, updated);
    expect(results.books.isNotEmpty, true);
    expect(results.books.length, normalListEndsAt);
  });
}

Future<Map<String, dynamic>> _getResultFromTestJson() async {
  final testJson = await File('assets/test.json').readAsString();
  final Map<String, dynamic> jsonParsed = json.decode(testJson);
  final Map<String, dynamic> resultJson = jsonParsed['results'];
  return resultJson;
}
