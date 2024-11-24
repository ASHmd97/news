import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/models/source_response/source_response.dart';

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
}
