import 'package:brazucaNews/screens/news_screen.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;

  NewsItem(this.snapshot, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // height: 230,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            // Image.network(image),
            // SizedBox(
            //   width: 200,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            //     child: FadeInImage.assetNetwork(
            //       placeholder: 'assets/images/placeholder_bg.png',
            //       image: snapshot.data.articles[index].urlToImage != null
            //       ? snapshot.data.articles[index].urlToImage
            //       : 'https://firebasestorage.googleapis.com/v0/b/chatflutter-36b9a.appspot.com/o/error_image.png?alt=media',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            SizedBox(
              width: 375,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder_bg.png',
                  image: snapshot.data.articles[index].urlToImage != null
                  ? snapshot.data.articles[index].urlToImage
                  : 'https://firebasestorage.googleapis.com/v0/b/chatflutter-36b9a.appspot.com/o/error_image.png?alt=media',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
              child: Text(
                snapshot.data.articles[index].title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                snapshot.data.articles[index].description,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsScreen(snapshot, index)));
      },
    );
  }
}
