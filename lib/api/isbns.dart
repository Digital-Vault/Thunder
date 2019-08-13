/// A class representing International Standard Book Number.
class Isbns {
  /// Creates an [Isbns] object.
  const Isbns({this.isbn10, this.isbn13});

  /// Creates an [Isbns] ojbect from [json].
  ///
  /// ```dart
  /// final Map<String, dynamic> parsedIsbns = json.decode(data);
  /// final isbns = Isbns.fromJson(parsedIsbns);
  /// ```
  factory Isbns.fromJson(Map<String, dynamic> json) =>
      Isbns(isbn10: json['isbn10'], isbn13: json['isbn13']);

  /// International Standard Book Number (ISBN10)
  final String isbn10;

  /// International Standard Book Number (ISBN13)
  final String isbn13;
}
