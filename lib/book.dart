class Book {
  final String title;
  final String description;
  final String author;
  final String isbn13;
  final String isbn10;
  final String productUrl;

  const Book(
      {this.title,
      this.description,
      this.author,
      this.isbn13,
      this.isbn10,
      this.productUrl});

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson == null) {
      return null;
    }

    return Book(
      title: parsedJson['results'][0]['book_details'][0]['title'],
      description: parsedJson['results'][0]['book_details'][0]['description'],
      author: parsedJson['results'][0]['book_details'][0]['author'],
      isbn13: parsedJson['results'][0]['book_details'][0]['primary_isbn13'],
      isbn10: parsedJson['results'][0]['book_details'][0]['primary_isbn10'],
      productUrl: parsedJson['results'][0]['amazon_product_url']
    );
  }
}
