import 'package:daryouz_clone/constants/image.dart';
import 'package:daryouz_clone/pages/home/columnists.dart';
import 'package:daryouz_clone/pages/home/general.dart';
import 'package:daryouz_clone/pages/home/newest.dart';
import 'package:daryouz_clone/pages/home/top_news.dart';
import 'package:flutter/material.dart';
bool isShort=false;
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages=[
      NewestPAge(),
      GeneralPAge(),
      TopPage(),
      ColumnistsPage()
    ];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.search), onPressed: () {  },),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Image.asset(AppImage.app_logo),
          SizedBox(width: 90,),
          IconButton(icon: Icon(Icons.menu), onPressed: () {
            _scaffoldKey.currentState!.openEndDrawer();
          },),
        ],


      ),
      endDrawer: Drawer(child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                    currentPage=0;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("So'nggi yangiliklar"),
                    SizedBox(height: 8,width: 8,),
                    Icon(Icons.newspaper)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                    currentPage=1;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Asosiy yangiliklar"),
                    SizedBox(height: 8,width: 8,),
                    Icon(Icons.tv)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                    currentPage=0;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Ko'p o'qilgan yangiliklar"),
                    SizedBox(height: 8,width: 8,),
                    Icon(Icons.newspaper)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                    currentPage=3;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Kolumnistlar"),
                    SizedBox(height: 8,width: 8,),
                    Icon(Icons.newspaper)
                  ],
                ),
              ),

            ],
          ),
        ),
      )),
      body: SafeArea(
        child: pages[currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState((){
            currentPage=value;
          });
        },
        type: BottomNavigationBarType.fixed,
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: "So'nggi"),
        BottomNavigationBarItem(icon: Icon(Icons.tv),label: "Asosiy"),
        BottomNavigationBarItem(icon: Icon(Icons.hourglass_top_sharp),label: "Ko'p o'qilgan"),
        BottomNavigationBarItem(icon: Icon(Icons.pattern),label: "Kolumnistlar"),
      ]),

    );
  }
}


