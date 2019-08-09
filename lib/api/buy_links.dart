/// A structure for available places to purchase the book.
class BuyLinks {
  /// Creates a [BuyLinks] object.
  const BuyLinks({this.name, this.url});

  /// Creates a [BuyLinks] object from [json].
  factory BuyLinks.fromJson(Map<String, dynamic> json) =>
      BuyLinks(name: json['name'], url: json['url']);

  /// Name of supplier.
  final String name;

  /// Purchase URL.
  final String url;
}
