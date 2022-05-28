import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article.model.dart';

// https://api.spaceflightnewsapi.net/v3/documentation
class ArticleService {
  final String _authority = 'api.spaceflightnewsapi.net';
  final String _endPoint = '/v3/articles';

  Future<List<Article>> getArticles({
    required int limit,
    required int offset,
  }) async {
    final Uri url = Uri.https(_authority, _endPoint, {
      '_limit': '$limit',
      '_start': '$offset',
    });
    final response = await http.get(url);
    final List<dynamic> responseDecode = json.decode(response.body);
    return responseDecode.map((e) => Article.fromMap(e)).toList();
  }
}
