import 'package:festival_post_app/screens/details.dart';
import 'package:festival_post_app/screens/details_page.dart';
import 'package:festival_post_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => const homepage(),
        'details': (context) => const details_page(),
        'detaills': (context) => const detailss(),
      },
    ),
  );
}
