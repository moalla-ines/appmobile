import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Article.dart';
class ArticleServices {  //Recuperer des articles a partir de l'API
  static Future<List<Articles>> getAllArticles() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2024-02-19&to=2024-02-19&sortBy=popularity&apiKey=d1524278d8154a8d862be41a94ae2513');
        final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> articlesList = jsonData['articles'];
      List<Articles> articles = [];
      for (var item in articlesList) {
        articles.add(Articles.fromJson(item));
      }
      print(articles[0]);
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
  static Future<String> getAuthorAtIndex(int index) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2024-02-19&to=2024-02-19&sortBy=popularity&apiKey=d1524278d8154a8d862be41a94ae2513');
        final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> articlesList = jsonData['articles'];
      if (index >= 0 && index < articlesList.length) {
        return articlesList[index]['author'] ?? 'Unknown';
      } else {
        throw Exception('Index out of range');
      }
    } else {
      throw Exception('Failed to load articles');
    }
  }
}//En résumé, la classe ArticleServices fournit des méthodes pour récupérer des articles
// à partir d'une API en utilisant des requêtes HTTP et
// pour extraire des informations spécifiques sur les articles, telles que l'auteur.





