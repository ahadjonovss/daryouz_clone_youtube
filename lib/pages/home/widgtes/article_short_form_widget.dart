import 'dart:math';

import 'package:daryouz_clone/components/models/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class articleShortFormWidet extends StatelessWidget {
  Article article;
   articleShortFormWidet({required this.article,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(
        Uri.parse(article.url),
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'}),
        )) {
        throw 'Could not launch ${article.url}';
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3))
        ),
        height: 170,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 6),
                  height: 16,
                  width: 3,
                  color: Colors.pink,
                ),
                Text(article.source.name.toString(),style: TextStyle(color: Colors.grey),)
              ],
            ),
            Row(
              children: [
                Container(
                  width: 200,
                  child: Text(article.title,
                    maxLines: 3,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                ),
                Container(
                  height: 80,
                  width: 130,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(article.urlToImage),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Row(
                  children:  [
                    Text("${DateTime.parse(article.publishedAt).hour}:${DateTime.parse(article.publishedAt).minute}",style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.visibility_outlined,color: Colors.grey,),
                    Text(Random().nextInt(1000).toString(),style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}
