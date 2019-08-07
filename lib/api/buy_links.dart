class BuyLinks {
  final String name;
  final String url;

  const BuyLinks({this.name, this.url});

  factory BuyLinks.fromJson(Map<String, dynamic> json) {
    return BuyLinks(name: json['name'], url: json['url']);
  }
}
