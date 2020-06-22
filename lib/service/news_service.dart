import 'dart:convert';
import 'package:http/http.dart' as http;

const API_KEY = '3fd03a33aa614fea8ced86fd8af31bf7';

class NewsService {

  String category = 'general';

  Future<Map> getNews() async {
    http.Response response;
    response = await http.get('http://newsapi.org/v2/top-headlines?country=br&category=$category&apiKey=3fd03a33aa614fea8ced86fd8af31bf7');
    if (response.statusCode != 200) 
      throw Exception();
      else 
    return json.decode(response.body);
  }

}