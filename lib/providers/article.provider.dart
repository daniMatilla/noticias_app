import 'package:flutter/cupertino.dart';
import 'package:noticias_app/models/article.model.dart';
import 'package:noticias_app/services/article.service.dart';

class ArticleProvider with ChangeNotifier {
  final ArticleService _articleService = ArticleService();
  final _limit = 10;
  var _offset = 0;

  List<Article> _articles = [];
  List<Article> get articles => _articles;
  set articles(List<Article> articles) {
    _articles = [..._articles, ...articles];
    notifyListeners();
  }

  ArticleProvider() {
    getArticles();
  }

  Future getArticles() async {
    articles =
        await _articleService.getArticles(limit: _limit, offset: _offset);
  }
}
