class Isbns {
  final String isbn10;
  final String isbn13;

  const Isbns({this.isbn10, this.isbn13});

  factory Isbns.fromJson(Map<String, dynamic> json) {
    return Isbns(isbn10: json['isbn10'], isbn13: json['isbn13']);
  }
}