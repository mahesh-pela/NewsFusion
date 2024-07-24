import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget{
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsUrl;

  NewsContainer({super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsUrl
  });

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
                Image.network(imgUrl,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  //will cover all the entire container with the image of every aspect ratio
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10,),
                Text(newsHead, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                SizedBox(height: 5),
                Text(newsDesc, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                //spacer is used to evenly distribute the space
                Spacer(),
                Row(

                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                          onPressed: (){
                            print("$newsUrl");
                          },
                        child: Text("Read More", style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,)
              ]
          ),
        )
    );
  }

}