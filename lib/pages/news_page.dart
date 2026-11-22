import 'package:flutter/material.dart';
import 'package:news_application/providers/news_provider.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("News")),
        body: Consumer<NewsProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (value.error != null) {
              return Center(child: Text(value.error!));
            }
            return ListView.builder(
              itemCount: value.articles.length,
              itemBuilder: (context, index) {
                final article = value.articles[index];
                return ListTile(
                  leading: article.urlToImage != null
                      ? Image.network(article.urlToImage!)
                      : Icon(Icons.image_not_supported),
                  title: Text(article.title),
                  subtitle: Text(article.source.name),
                  onTap: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
