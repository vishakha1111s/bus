import 'package:flutter/material.dart';
import 'package:untitled2/presentation/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          brightness: Brightness.light,
          primaryColor: Colors.purple,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Georgia', //text styling
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )),
      home: NewsPage(),
    );
  }
}
