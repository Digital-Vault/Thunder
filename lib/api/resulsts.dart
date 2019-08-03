import 'book.dart';

class Results {
  final String listName;
  final String listNameEncoded;
  final String bestsellersDate;
  final String publishedDate;
  final String publishedDateDescription;
  final String nextPublishedDate;
  final String previousPublishedDate;
  final String displayName;
  final int normalListEndsAt;
  final String updated;
  final List<Book> books;

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

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
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
        books: _findBooks(json['books']));
  }
    static List<Book> _findBooks(List<dynamic> books) {
    List<Book> bookList = [];
    books.forEach((v) {
      bookList.add(Book.fromJson(v));
    });
    return bookList;
  }
}