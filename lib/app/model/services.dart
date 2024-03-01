import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Article.dart';

class ArticleServices {
  static Future<List<Articles>> getAllArticles() async {
    final url = Uri.parse(' https://newsapi.org/v2/everything?q=apple&from=2024-02-19&to=2024-02-19&sortBy=popularity&apiKey=d1524278d8154a8d862be41a94ae2513 ');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Articles> articles = [];
      for (var item in jsonData) {
        articles.add(Articles.fromJson(item));
      }
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}