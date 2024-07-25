import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDesc;
  final String newsUrl;

  NewsContainer({
    Key? key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Using FadeInImage to handle placeholder and error
            FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png',
              image: imgUrl,
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/error.png',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(height: 10),
            Text(
              newsHead,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 5),
            Text(
              newsDesc,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      print("$newsUrl");
                    },
                    child: Text(
                      "Read More",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
