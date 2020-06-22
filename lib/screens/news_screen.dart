import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatelessWidget {

  final AsyncSnapshot snapshot;
  final int index;

  NewsScreen(this.snapshot, this.index);

  _launchURL(url) async {
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snapshot.data['articles'][index]['source']['name']),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage.memoryNetwork( 
              placeholder: kTransparentImage,
              image: snapshot.data['articles'][index]['urlToImage'],
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 4),
              child: Text(
                snapshot.data['articles'][index]['title'],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                snapshot.data['articles'][index]['description'],
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                 "Autor: ${snapshot.data['articles'][index]['author'] == null ? snapshot.data['articles'][index]['source']['name'] : snapshot.data['articles'][index]['author']}" 
              ),
            ),
            Center(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    "Matéria Completa",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                onTap: () {
                  _launchURL(snapshot.data['articles'][index]['url']);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}