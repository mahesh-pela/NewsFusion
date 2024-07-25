//https://newsapi.org/v2/everything?q=apple&from=2024-07-23&to=2024-07-23&sortBy=popularity&apiKey=11a34efd38354bf181311f356a23c5e1
import 'dart:convert';
import 'package:http/http.dart';

class NewsArticle{
  final String imgUrl;
  final String newsHead;
  final String newsDesc;
  final String newsUrl;

  NewsArticle({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json){
    return NewsArticle(
      imgUrl: json['urlToImage'] ?? 'https://via.placeholder.com/300',
      newsHead: json['title'] ?? 'No Title',
      newsDesc: json['description'] ?? 'No Description',
      newsUrl: json['url'] ?? '',
    );
  }
}
class FetchNews{
  static Future<List<NewsArticle>> fetchNews() async{
    final response = await get(Uri.parse(
      "https://newsapi.org/v2/everything?q=apple&from=2024-07-23&to=2024-07-23&sortBy=popularity&apiKey=11a34efd38354bf181311f356a23c5e1"
    ));

    if(response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> articles = json['articles'];

      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else{
      throw Exception('Failed to load news');
    }
  }
}