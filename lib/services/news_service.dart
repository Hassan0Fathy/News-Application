import 'package:dio/dio.dart';
import 'package:news_application/models/news_model.dart';

class NewsService {
  Dio dio = Dio();
  Future<NewsModel> getData() async {
    try {
      final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=39c5f0038d274b86ac6cbe948b7e1ccf',
      );
      return NewsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Something wrong $e");
    }
  }
}
