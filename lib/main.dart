import 'package:flutter/material.dart';
import 'package:pelis/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pelis',
      initialRoute: '/',
      routes: {'/': (BuildContext context) => HomePage()},
    );
  }
}
