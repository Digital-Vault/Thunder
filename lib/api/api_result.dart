import 'package:flutter_sample/api/results.dart';

/// A structure for the NY Times books [API](https://developer.nytimes.com/docs/books-product/1/overview).
class ApiResult {
  /// Creates an [ApiResult] object.
  const ApiResult(
      {this.status,
      this.copyright,
      this.numResults,
      this.lastModified,
      this.results});

  /// Creates an [ApiResult] object from [json].
  factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
        status: json['status'],
        copyright: json['copyright'],
        numResults: json['num_results'],
        lastModified: json['last_modified'],
        results: Results.fromJson(json['results']),
      );

  /// Status of the request
  final String status;

  /// Copyright statement
  final String copyright;

  /// Number of books
  final int numResults;

  /// Last date modified
  final String lastModified;

  /// Results of the query
  final Results results;
}
