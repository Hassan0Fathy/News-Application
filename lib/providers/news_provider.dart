import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  NewsService _newsService = NewsService();
  List<Article> articles = [];
  bool isLoading = false;
  String? error;
  Future<void> getNews() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final result = await _newsService.getData();
      articles = result.news;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
