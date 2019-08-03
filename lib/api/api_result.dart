import 'package:flutter_sample/api/resulsts.dart';

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