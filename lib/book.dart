class ApiResult {
  final String status;
  final String copyright;
  final int numResults;
  final String lastModified;
  final Results results;

  const ApiResult(
      {this.status,
      this.copyright,
      this.numResults,
      this.lastModified,
      this.results});

  factory ApiResult.fromJson(Map<String, dynamic> json) {
    return ApiResult(
        status: json['status'],
        copyright: json['copyright'],
        numResults: json['num_results'],
        lastModified: json['last_modified'],
        results: Results.fromJson(json['results']));
  }
}

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
  final List<Books> books;

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

  static List<Books> _findBooks(List<dynamic> books) {
    List<Books> bookList = [];
    books.forEach((v) {
      bookList.add(Books.fromJson(v));
    });
    return bookList;
  }
}

class Books {
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

  const Books(
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

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
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

class Isbns {
  final String isbn10;
  final String isbn13;

  const Isbns({this.isbn10, this.isbn13});

  factory Isbns.fromJson(Map<String, dynamic> json) {
    return Isbns(isbn10: json['isbn10'], isbn13: json['isbn13']);
  }
}

class BuyLinks {
  final String name;
  final String url;

  const BuyLinks({this.name, this.url});

  factory BuyLinks.fromJson(Map<String, dynamic> json) {
    return BuyLinks(name: json['name'], url: json['url']);
  }
}
