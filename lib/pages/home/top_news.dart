import 'package:daryouz_clone/pages/home/widgtes/article_short_form_widget.dart';
import 'package:daryouz_clone/pages/home/widgtes/article_widget.dart';
import 'package:daryouz_clone/pages/home/widgtes/shimmers/default_article_shimmer.dart';
import 'package:flutter/material.dart';

import '../../service/article_service.dart';
import '../main_page.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getArticles(url: "https://newsapi.org/v2/everything?q=apple&from=2022-11-18&to=2022-11-18&sortBy=popularity&apiKey=465c997f9c95497c81e8d8b5f700b9f7"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            List articles=snapshot.data.articles;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.4)),

                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text("Bugun,  ",style: TextStyle(color: Colors.grey),),
                                Text("Shanba 15:38,",style: TextStyle(fontWeight: FontWeight.w600),),

                              ],
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){
                                  isShort=false;
                                  setState((){});
                                }, icon: Icon(Icons.splitscreen_rounded)),
                                IconButton(onPressed: (){
                                  isShort=true;
                                  setState((){});
                                }, icon: Icon(Icons.menu_open_sharp))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => isShort==true?articleShortFormWidet(article: articles[index],):article_widget(article: articles[index]),
                        itemCount: articles.length,
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          if(snapshot.hasError){
            return Container(
              child: Center(
                  child: Text(snapshot.error.toString())
              ),
            );
          }

          if(snapshot.connectionState==ConnectionState.waiting){
            return ListView.builder(itemBuilder: (context, index) {
              return defaultArticleShimmer();
            },
              itemCount: 4,);
          }

          return Container();
        },

      ),
    );
  }
}
