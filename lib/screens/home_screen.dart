import 'package:brazucaNews/category_enum.dart';
import 'package:brazucaNews/components/news_item.dart';
import 'package:brazucaNews/service/news_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _selectCategory(Category result) {
    setState(() {
      switch (result) {
        case Category.general:
          return newsService.category = 'general';
        case Category.business:
          return newsService.category = 'business';
        case Category.entertainment:
          return newsService.category = 'entertainment';
        case Category.health:
          return newsService.category = 'health';
        case Category.science:
          return newsService.category = 'science';
        case Category.sports:
          return newsService.category = 'sports';
        case Category.technology:
          return newsService.category = 'technology';
      }
    });
  }

  final newsService = NewsService();

  // getInfoNews() async {
  //   news = await newsService.getNews();
  // }

  // Future<News> news;
  // News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Image.asset('assets/images/logo_icon.png'), onPressed: null),
        title: Image.asset('assets/images/logo_text.png'),
        centerTitle: true,
        actions: [
          // TODO Trocar botão de categorias
          // IconButton(
          //   icon: Icon(Icons.more_vert),
          //   onPressed: () {

          //   },
          // ),
          PopupMenuButton<Category>(
            itemBuilder: (context) => <PopupMenuEntry<Category>>[
              const PopupMenuItem<Category>(
                child: Text('Geral'),
                value: Category.general,
              ),
              const PopupMenuItem<Category>(
                child: Text('Negócios'),
                value: Category.business,
              ),
              const PopupMenuItem<Category>(
                child: Text('Esportes'),
                value: Category.sports,
              ),
              const PopupMenuItem<Category>(
                child: Text('Saúde'),
                value: Category.health,
              ),
              const PopupMenuItem<Category>(
                child: Text('Entreterimento'),
                value: Category.entertainment,
              ),
              const PopupMenuItem<Category>(
                child: Text('Tecnologia'),
                value: Category.technology,
              ),
              const PopupMenuItem<Category>(
                child: Text('Ciência'),
                value: Category.science,
              )
            ],
            onSelected: _selectCategory,
          )
        ],
      ),
      body: FutureBuilder(
        future: newsService.getNews(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
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
                return Container(
                  child: Center(
                    child: Image.asset('assets/images/error.png'),
                  ),
                );
              else
                return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    return NewsItem(snapshot, index
                        // image: snapshot.data.articles[index].urlToImage,
                        // title: snapshot.data.articles[index].title,
                        // description: snapshot.data.articles[index].description,
                        );
                  },
                );
          }
        },
      ),
    );
  }
}
