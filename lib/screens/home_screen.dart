import 'package:brazucaNews/components/news_item.dart';
import 'package:brazucaNews/service/news_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final newsService = NewsService();

  @override
  void initState() {
    newsService.getNews().then((value) => print(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Brasuca'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: newsService.getNews(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting :
            case ConnectionState.none :
            return Container(
              alignment: Alignment.center,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 5,
                ),
              ),
            );
            default:
            if (snapshot.hasError)
              return Container( child: Center(child: Text('errou'),),);
            else
            return ListView.builder(
              itemCount: snapshot.data['articles'].length,
              itemBuilder: (context, index) {
                return NewsItem(
                  snapshot,
                  index,
                );
              },
            );
          }
        },
      ),
    );
  } 

}