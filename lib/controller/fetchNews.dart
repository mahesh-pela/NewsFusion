//https://newsapi.org/v2/everything?q=apple&from=2024-07-23&to=2024-07-23&sortBy=popularity&apiKey=11a34efd38354bf181311f356a23c5e1
import 'dart:convert';

import 'package:http/http.dart';
class FetchNews{
  static fetchNews() async{
    Response response = await get(Uri.parse("https://newsapi.org/v2/everything?q=apple&from=2024-07-23&to=2024-07-23&sortBy=popularity&apiKey=11a34efd38354bf181311f356a23c5e1"));

    Map body_data = jsonDecode(response.body);
    print(body_data);
  }
}