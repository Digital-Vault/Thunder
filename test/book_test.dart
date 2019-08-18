import 'dart:convert';
import 'dart:io';

import 'package:flutter_sample/api/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create a book using constructor', () async {
    final jsonParsed = await _getParsedTestBook();

    final rank = jsonParsed['rank'] as int;
    final rankLastWeek = jsonParsed['rank_last_week'] as int;
    final weeksOnList = jsonParsed['weeks_on_list'] as int;
    final asterisk = jsonParsed['asterisk'] as int;
    final dagger = jsonParsed['dagger'] as int;
    final primaryIsbn10 = jsonParsed['primary_isbn10'] as String;
    final primaryIsbn13 = jsonParsed['primary_isbn13'] as String;
    final publisher = jsonParsed['publisher'] as String;
    final description = jsonParsed['description'] as String;
    final price = jsonParsed['price'] as int;
    final title = jsonParsed['title'] as String;
    final author = jsonParsed['author'] as String;
    final contributor = jsonParsed['contributor'] as String;
    final contributorNote = jsonParsed['contributor_note'] as String;
    final bookImage = jsonParsed['book_image'] as String;
    final bookImageWidth = jsonParsed['book_image_width'] as int;
    final bookImageHeight = jsonParsed['book_image_height'] as int;
    final amazonProductUrl = jsonParsed['amazon_product_url'] as String;
    final ageGroup = jsonParsed['age_group'] as String;
    final bookReviewLink = jsonParsed['book_review_link'] as String;
    final firstChapterLink = jsonParsed['first_chapter_link'] as String;
    final sundayReviewLink = jsonParsed['sunday_review_link'] as String;
    final articleChapterLink = jsonParsed['article_chapter_link'] as String;

    final book = Book(
      rank: rank,
      rankLastWeek: rankLastWeek,
      weeksOnList: weeksOnList,
      asterisk: asterisk,
      dagger: dagger,
      primaryIsbn10: primaryIsbn10,
      primaryIsbn13: primaryIsbn13,
      publisher: publisher,
      description: description,
      price: price,
      title: title,
      author: author,
      contributor: contributor,
      contributorNote: contributorNote,
      bookImage: bookImage,
      bookImageWidth: bookImageWidth,
      bookImageHeight: bookImageHeight,
      amazonProductUrl: amazonProductUrl,
      ageGroup: ageGroup,
      bookReviewLink: bookReviewLink,
      firstChapterLink: firstChapterLink,
      sundayReviewLink: sundayReviewLink,
      articleChapterLink: articleChapterLink,
    );

    expect(book.rank, rank);
    expect(book.rankLastWeek, rankLastWeek);
    expect(book.weeksOnList, weeksOnList);
    expect(book.asterisk, asterisk);
    expect(book.dagger, dagger);
    expect(book.primaryIsbn10, primaryIsbn10);
    expect(book.primaryIsbn13, primaryIsbn13);
    expect(book.publisher, publisher);
    expect(book.description, description);
    expect(book.price, price);
    expect(book.title, title);
    expect(book.author, author);
    expect(book.contributor, contributor);
    expect(book.contributorNote, contributorNote);
    expect(book.bookImage, bookImage);
    expect(book.bookImageWidth, bookImageWidth);
    expect(book.bookImageHeight, bookImageHeight);
    expect(book.amazonProductUrl, amazonProductUrl);
    expect(book.ageGroup, ageGroup);
    expect(book.bookReviewLink, bookReviewLink);
    expect(book.firstChapterLink, firstChapterLink);
    expect(book.sundayReviewLink, sundayReviewLink);
    expect(book.articleChapterLink, articleChapterLink);
  });

  test('Create a book from json', () async {
    final jsonParsed = await _getParsedTestBook();

    final rank = jsonParsed['rank'] as int;
    final rankLastWeek = jsonParsed['rank_last_week'] as int;
    final weeksOnList = jsonParsed['weeks_on_list'] as int;
    final asterisk = jsonParsed['asterisk'] as int;
    final dagger = jsonParsed['dagger'] as int;
    final primaryIsbn10 = jsonParsed['primary_isbn10'] as String;
    final primaryIsbn13 = jsonParsed['primary_isbn13'] as String;
    final publisher = jsonParsed['publisher'] as String;
    final description = jsonParsed['description'] as String;
    final price = jsonParsed['price'] as int;
    final title = jsonParsed['title'] as String;
    final author = jsonParsed['author'] as String;
    final contributor = jsonParsed['contributor'] as String;
    final contributorNote = jsonParsed['contributor_note'] as String;
    final bookImage = jsonParsed['book_image'] as String;
    final bookImageWidth = jsonParsed['book_image_width'] as int;
    final bookImageHeight = jsonParsed['book_image_height'] as int;
    final amazonProductUrl = jsonParsed['amazon_product_url'] as String;
    final ageGroup = jsonParsed['age_group'] as String;
    final bookReviewLink = jsonParsed['book_review_link'] as String;
    final firstChapterLink = jsonParsed['first_chapter_link'] as String;
    final sundayReviewLink = jsonParsed['sunday_review_link'] as String;
    final articleChapterLink = jsonParsed['article_chapter_link'] as String;

    final book = Book.fromJson(jsonParsed);

    expect(book.rank, rank);
    expect(book.rankLastWeek, rankLastWeek);
    expect(book.weeksOnList, weeksOnList);
    expect(book.asterisk, asterisk);
    expect(book.dagger, dagger);
    expect(book.primaryIsbn10, primaryIsbn10);
    expect(book.primaryIsbn13, primaryIsbn13);
    expect(book.publisher, publisher);
    expect(book.description, description);
    expect(book.price, price);
    expect(book.title, title);
    expect(book.author, author);
    expect(book.contributor, contributor);
    expect(book.contributorNote, contributorNote);
    expect(book.bookImage, bookImage);
    expect(book.bookImageWidth, bookImageWidth);
    expect(book.bookImageHeight, bookImageHeight);
    expect(book.amazonProductUrl, amazonProductUrl);
    expect(book.ageGroup, ageGroup);
    expect(book.bookReviewLink, bookReviewLink);
    expect(book.firstChapterLink, firstChapterLink);
    expect(book.sundayReviewLink, sundayReviewLink);
    expect(book.articleChapterLink, articleChapterLink);
  });
}

Future<Map<String, dynamic>> _getParsedTestBook() async {
  final testJson = await File('assets/test_book.json').readAsString();
  final Map<String, dynamic> jsonParsed = json.decode(testJson);
  return jsonParsed;
}
