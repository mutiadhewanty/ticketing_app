import 'package:flutter/material.dart';
import 'package:ticketing_app/views/home.dart';
import 'package:ticketing_app/views/welcome.dart';
import 'package:ticketing_app/widgets/images_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Euphoria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Welcome(),
    );
  }
}
