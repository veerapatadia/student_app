import 'package:flutter/material.dart';
import 'package:studentapp/screens/addpage.dart';
import 'package:studentapp/screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => home_page(),
        'add_page': (context) => adddatapage(),
      },
    ),
  );
}
