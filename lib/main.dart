import 'package:flutter/material.dart';
import 'package:ticketing_app/views/home.dart';
import 'package:ticketing_app/views/login.dart';
import 'package:ticketing_app/views/register.dart';
import 'package:ticketing_app/views/welcome.dart';
import 'package:ticketing_app/widgets/images_card.dart';

import 'model/place.dart';
import 'views/bookPlace.dart';
import 'views/checkoutTicket.dart';
import 'views/orderTicket.dart';
import 'widgets/increment_button.dart';

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
      home: RegisterScreen(),
    );
  }
}



class DetailBooking extends StatelessWidget {

  // final Map place;
  // const DetailBooking({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Detail Booking Tempat'),
      ),
    );
  }
}

