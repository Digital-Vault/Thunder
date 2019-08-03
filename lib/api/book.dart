import 'buy_links.dart';
import 'isbns.dart';

class Book {
  final int rank;
  final int rankLastWeek;
  final int weeksOnList;
  final int asterisk;
  final int dagger;
  final String primaryIsbn10;
  final String primaryIsbn13;
  final String publisher;
  final String description;
  final int price;
  final String title;
  final String author;
  final String contributor;
  final String contributorNote;
  final String bookImage;
  final int bookImageWidth;
  final int bookImageHeight;
  final String amazonProductUrl;
  final String ageGroup;
  final String bookReviewLink;
  final String firstChapterLink;
  final String sundayReviewLink;
  final String articleChapterLink;
  final List<Isbns> isbns;
  final List<BuyLinks> buyLinks;

  const Book(
      {this.rank,
      this.rankLastWeek,
      this.weeksOnList,
      this.asterisk,
      this.dagger,
      this.primaryIsbn10,
      this.primaryIsbn13,
      this.publisher,
      this.description,
      this.price,
      this.title,
      this.author,
      this.contributor,
      this.contributorNote,
      this.bookImage,
      this.bookImageWidth,
      this.bookImageHeight,
      this.amazonProductUrl,
      this.ageGroup,
      this.bookReviewLink,
      this.firstChapterLink,
      this.sundayReviewLink,
      this.articleChapterLink,
      this.isbns,
      this.buyLinks});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        rank: json['rank'],
        rankLastWeek: json['rank_last_week'],
        weeksOnList: json['weeks_on_list'],
        asterisk: json['asterisk'],
        dagger: json['dagger'],
        primaryIsbn10: json['primary_isbn10'],
        primaryIsbn13: json['primary_isbn13'],
        publisher: json['publisher'],
        description: json['description'],
        price: json['price'],
        title: json['title'],
        author: json['author'],
        contributor: json['contributor'],
        contributorNote: json['contributor_note'],
        bookImage: json['book_image'],
        bookImageWidth: json['book_image_width'],
        bookImageHeight: json['book_image_height'],
        amazonProductUrl: json['amazon_product_url'],
        ageGroup: json['age_group'],
        bookReviewLink: json['book_review_link'],
        firstChapterLink: json['first_chapter_link'],
        sundayReviewLink: json['sunday_review_link'],
        articleChapterLink: json['article_chapter_link'],
        isbns: _findIsbns(json['isbns']),
        buyLinks: _findBuyLinks(json['buy_links']));
  }

  static List<Isbns> _findIsbns(List<dynamic> isbn) {
    List<Isbns> isbns = [];
    isbn.forEach((v) {
      isbns.add(Isbns.fromJson(v));
    });
    return isbns;
  }

  static List<BuyLinks> _findBuyLinks(List<dynamic> links) {
    List<BuyLinks> buyLinks = [];
    links.forEach((v) {
      buyLinks.add(BuyLinks.fromJson(v));
    });

    return buyLinks;
  }
}