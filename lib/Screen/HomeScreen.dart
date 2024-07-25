import 'package:flutter/material.dart';

import '../controller/fetchNews.dart';
import 'Widgets/NewsContainer.dart';
    // Ensure you import the correct file path

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<NewsArticle>> _newsArticles;

  @override
  void initState() {
    super.initState();
    _newsArticles = FetchNews.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<NewsArticle>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news found'));
          } else {
            final newsArticles = snapshot.data!;
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                final article = newsArticles[index];
                return NewsContainer(
                  imgUrl: article.imgUrl,
                  newsHead: article.newsHead,
                  newsDesc: article.newsDesc,
                  newsUrl: article.newsUrl,
                );
              },
            );
          }
        },
      ),
    );
  }
}
