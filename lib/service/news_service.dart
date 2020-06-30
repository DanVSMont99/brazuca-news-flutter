import 'package:brazucaNews/model/news_model.dart';
import 'package:dio/dio.dart';

const API_KEY = '3fd03a33aa614fea8ced86fd8af31bf7';

class NewsService {
  final Dio _dio = Dio();

  String category = 'general';

  Future<News> getNews() async {
    Response response;
    response = await _dio.get('http://newsapi.org/v2/top-headlines?country=br&category=$category&apiKey=3fd03a33aa614fea8ced86fd8af31bf7');
    if (response.statusCode != 200) 
      throw Exception();
      else 
    return News.fromJson(response.data);
    // json.decode response.body ;
  }


}