import 'buy_links.dart';
import 'isbns.dart';

/// A strucutre for a book fom API
class Book {
  /// Creates [Book].
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

  /// Creates [Book] from [json].
  factory Book.fromJson(Map<String, dynamic> json) => Book(
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

  /// Rank in the list.
  final int rank;

  /// Rank last week.
  final int rankLastWeek;

  /// Number of weeks on the list.
  final int weeksOnList;

  /// Not sure
  final int asterisk;

  /// Not sure
  final int dagger;

  /// Primary ISBN10 of the book. This information is also available
  /// in [Isbns].
  final String primaryIsbn10;

  /// Primary ISBN13 of the book. This information is also available
  /// in [Isbns].
  final String primaryIsbn13;

  /// Name of the publisher.
  final String publisher;

  /// Description about the book.
  final String description;

  /// Price of the book. This value seems to be always 0.
  final int price;

  /// Title for the book.
  final String title;

  /// Author of the book.
  final String author;

  /// Name of a contributor.
  final String contributor;

  /// Contributor notes about the book.
  final String contributorNote;

  /// Book cover URL.
  final String bookImage;

  /// Width of the cover image.
  final int bookImageWidth;

  /// Height of the cover image.
  final int bookImageHeight;

  /// Amazon URL for the book.
  final String amazonProductUrl;

  /// Age group for the book.
  final String ageGroup;

  /// NY Times URL for books review.
  final String bookReviewLink;

  /// URL for the first chapter of the book.
  final String firstChapterLink;

  /// URL for sundays review.
  final String sundayReviewLink;

  /// URL for article chapters for the book.
  final String articleChapterLink;

  /// ISBN numbers for the book.
  final List<Isbns> isbns;

  /// List of places to purchase the book.
  final List<BuyLinks> buyLinks;

  static List<Isbns> _findIsbns(List<dynamic> isbn) {
    final isbns = <Isbns>[];

    for (final i in isbn) {
      isbns.add(Isbns.fromJson(i));
    }

    return isbns;
  }

  static List<BuyLinks> _findBuyLinks(List<dynamic> links) {
    final buyLinks = <BuyLinks>[];

    for (final i in links) {
      buyLinks.add(BuyLinks.fromJson(i));
    }

    return buyLinks;
  }
}
