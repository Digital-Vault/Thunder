import 'book.dart';

/// A structure for the main section of the API call.
class Results {
  /// Creates a [Results] object.
  const Results(
      {this.listName,
      this.listNameEncoded,
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.nextPublishedDate,
      this.previousPublishedDate,
      this.displayName,
      this.normalListEndsAt,
      this.updated,
      this.books});

  /// Creates a [Results] object from [json].
  factory Results.fromJson(Map<String, dynamic> json) => Results(
      listName: json['list_name'],
      listNameEncoded: json['list_name_encoded'],
      bestsellersDate: json['bestsellers_date'],
      publishedDate: json['published_date'],
      publishedDateDescription: json['published_date_description'],
      nextPublishedDate: json['next_published_date'],
      previousPublishedDate: json['previous_published_date'],
      displayName: json['display_name'],
      normalListEndsAt: json['normal_list_ends_at'],
      updated: json['updated'],
      books: _findAllBooks(json['books']));

  /// Name of the list (eg. Hardcover Fiction)
  final String listName;

  /// Encoded name of the list (eg. hardcover-fiction)
  final String listNameEncoded;

  /// Date list was generated on
  final String bestsellersDate;

  /// Date the list was published on
  final String publishedDate;

  /// Description of published date (eg. latest)
  final String publishedDateDescription;

  /// Next publishing date
  final String nextPublishedDate;

  /// Previous published date
  final String previousPublishedDate;

  /// Display name of the list (eg. Hardcover Fiction)
  final String displayName;

  /// Number of items in the list
  final int normalListEndsAt;

  /// How often list gets updated (eg. Weekly)
  final String updated;

  /// Books in the list
  final List<Book> books;

  static List<Book> _findAllBooks(List<dynamic> books) {
    final bookList = <Book>[];

    for (final book in books) {
      bookList.add(Book.fromJson(book));
    }

    return bookList;
  }
}
