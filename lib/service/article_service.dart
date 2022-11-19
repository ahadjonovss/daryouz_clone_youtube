import '../components/models/all_news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<AllNews?> getArticles({ url="https://newsapi.org/v2/everything?q=tesla&from=2022-10-19&sortBy=publishedAt&apiKey=465c997f9c95497c81e8d8b5f700b9f7"}) async {

  Uri uri= Uri.parse(url);

  var response= await http.get(uri);
  if(response.statusCode==200){
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    await Future.delayed(Duration(seconds: 2));
    return AllNews.fromJson(jsonResponse);
  }
  return null;

  // class Mydata {
  // static String getDateTime(int dt)=> DateFormat.j().format(DateTime.fromMillisecondsSinceEpoch(dt*1000));

  // }

}