import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/shared/api_constant.dart';
import 'package:news/news/data/models/news_response.dart';
import 'package:news/sources/data/models/source_response.dart';

class ApiService {
  static Future<SourceResponse> getSources(String categoryId) async {
    Uri sourcesUri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.sourcesEndpoint,
      {
        "category": categoryId,
        "apiKey": ApiConstant.apiKey,
      },
    );

    final response = await http.get(sourcesUri);
    final json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getSourcesNews(String sourceId) async {
    Uri sourcesUri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.newsEndpoint,
      {
        "sources": sourceId,
        "apiKey": ApiConstant.apiKey,
      },
    );

    final response = await http.get(sourcesUri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
