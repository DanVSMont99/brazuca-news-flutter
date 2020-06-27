import 'package:brazucaNews/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsItem extends StatelessWidget {

  AsyncSnapshot snapshot;
  int index;

  NewsItem(this.snapshot, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
        child: Column(
          children: <Widget>[
            // Image.network(image),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: FadeInImage.memoryNetwork( 
                  placeholder: kTransparentImage,
                  image: snapshot.data.articles[index].urlToImage != null ? snapshot.data.articles[index].urlToImage : 'https://firebasestorage.googleapis.com/v0/b/chatflutter-36b9a.appspot.com/o/2.png?alt=media&token=03dc5578-dd4d-4084-ab92-38ad1c151a42',
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10 ,10, 10, 4),
              child: Text(
                snapshot.data.articles[index].title, 
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                snapshot.data.articles[index].description,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen(snapshot, index)));
      },
    );
  }
}
