import 'package:flutter/material.dart';
import 'package:studentapp/screens/addpage.dart';
import 'package:studentapp/screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'marc'),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homepage(),
        'add_page': (context) => adddatapage(),
      },
    ),
  );
}
