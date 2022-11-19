import 'package:daryouz_clone/constants/image.dart';
import 'package:daryouz_clone/pages/main_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MainPage()), (route) => false));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:Image.asset(AppImage.app_logo) ,
            ),
            Text("by ahadjonovss",style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
