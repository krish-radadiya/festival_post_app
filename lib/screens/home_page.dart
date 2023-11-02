import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../utils/quots/quotas.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Festival',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://t3.ftcdn.net/jpg/04/51/91/28/360_F_451912856_jr1iixvtHMqiapWTYFUYCk4pogFJ8axX.jpg',
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: Global.allQoutes.map((e) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed('quote', arguments: e);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("${e['thumbnail']}"),
                    ),
                  ),
                  child: Text(
                    "${e['category']}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
