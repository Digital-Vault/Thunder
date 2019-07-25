import 'package:flutter_sample/json_parsing.dart';
import 'package:flutter_sample/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test parsing json", () {
    final jsonString = """{
  "status": "OK",
  "copyright": "Copyright (c) 2019 The New York Times Company.  All Rights Reserved.",
  "num_results": 15,
  "last_modified": "2019-07-24T22:38:02-04:00",
  "results": [
    {
      "list_name": "Hardcover Fiction",
      "display_name": "Hardcover Fiction",
      "bestsellers_date": "2019-07-20",
      "published_date": "2019-08-04",
      "rank": 1,
      "rank_last_week": 0,
      "weeks_on_list": 1,
      "asterisk": 0,
      "dagger": 0,
      "amazon_product_url": "https://www.amazon.com/New-Girl-Novel-Gabriel-Allon-ebook/dp/B07F18LND4?tag=NYTBS-20",
      "isbns": [
        {
          "isbn10": "0062834835",
          "isbn13": "9780062834836"
        },
        {
          "isbn10": "0062834894",
          "isbn13": "9780062834898"
        }
      ],
      "book_details": [
        {
          "title": "THE NEW GIRL",
          "description": "Gabriel Allon, the chief of Israeli intelligence, partners with the crown prince of Saudi Arabia, whose daughter is kidnapped.",
          "contributor": "by Daniel Silva",
          "author": "Daniel Silva",
          "contributor_note": "",
          "price": 0,
          "age_group": "",
          "publisher": "Harper",
          "primary_isbn13": "9780062834836",
          "primary_isbn10": "0062834835"
        }
      ],
      "reviews": [
        {
          "book_review_link": "",
          "first_chapter_link": "",
          "sunday_review_link": "",
          "article_chapter_link": ""
        }
      ]
    }
  ]
}""";
    final expected = Book(
        title: "THE NEW GIRL",
        description:
            "Gabriel Allon, the chief of Israeli intelligence, partners with the crown prince of Saudi Arabia, whose daughter is kidnapped.",
        author: "Daniel Silva",
        isbn13: "9780062834836",
        isbn10: "0062834835",
        productUrl:
            "https://www.amazon.com/New-Girl-Novel-Gabriel-Allon-ebook/dp/B07F18LND4?tag=NYTBS-20");

    final actual = parseBook(jsonString);

    
    expect(actual.author, expected.author);
    expect(actual.description, expected.description);
  });
}
