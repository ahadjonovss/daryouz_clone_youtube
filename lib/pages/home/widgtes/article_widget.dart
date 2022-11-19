import 'dart:math';

import 'package:daryouz_clone/components/models/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/image.dart';

class article_widget extends StatelessWidget {
  Article article;
   article_widget({required this.article,Key? key}) : super(key: key);

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
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          color: Colors.white,
        ),
        height: 320,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              height: 118,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                   Text(article.title,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
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
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
