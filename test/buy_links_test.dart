import 'dart:convert';

import 'package:flutter_sample/api/buy_links.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create a buy links using constructor', () {
    const name = 'Local Booksellers';
    const url = 'https://random-url.com';
    const buyLink = BuyLinks(name: name, url: url);

    expect(buyLink.name, name);
    expect(buyLink.url, url);
  });

  test('Create a buy links from json', () {
    const name = 'Local Booksellers';
    const url = 'http://www.indiebound.org/book/9780062834836?aff=NYT';
    const jsonData = '{"name": "$name", "url": "$url"}';
    final Map<String, dynamic> jsonParsed = json.decode(jsonData);
    final buyLink = BuyLinks.fromJson(jsonParsed);

    expect(buyLink.name, name);
    expect(buyLink.url, url);
  });
}
