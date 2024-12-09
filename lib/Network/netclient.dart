import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp_flutter/Response/news_response.dart';

class Netclient {
  final String url = "https://berita-indo-api-next.vercel.app/api/";

  Future<NewsResponse> fetchNews(String newsChannel) async{
    final String endpoint = newsChannel;
    final response = await http.get(Uri.parse(url + endpoint));
    if(response.statusCode == 200){
      return NewsResponse.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed");
    }
  }
}


