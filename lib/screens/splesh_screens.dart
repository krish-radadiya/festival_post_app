import 'dart:async';

import 'package:flutter/material.dart';

class splesh_screen extends StatefulWidget {
  const splesh_screen({super.key});

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('home');
    });
    return Scaffold(
      backgroundColor: Color(0xFFFFFF01),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://us.123rf.com/450wm/vectomart/vectomart1608/vectomart160800023/61215681-illustration-of-india-background-showing-its-culture-and-diversity-with-monument-dance-and-festival.jpg"),
                ),
              ),
            ),
            Text("I Love My India ❤️"),
          ],
        ),
      ),
    );
  }
}
