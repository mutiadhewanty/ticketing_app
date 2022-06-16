import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart';

class CheckoutTicket extends StatelessWidget {
  final Map ticket;

  CheckoutTicket({required this.ticket});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: size.height * 0.1,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const Text(
                                "Checkout Ticketing",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 24),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://tv-fanatic-res.cloudinary.com/iu/s--KsaMOQ1r--/t_full/cs_srgb,f_auto,fl_strip_profile.lossy,q_auto:420/v1614349785/wanda-maximoff-wandavision-season-1-episode-8.png'),
                        ),
                      ),
                    ],
                  ),
                  // create center image container
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 200.0,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1591285713698-598d587de63e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  
                  //create input name
                  Text('Atas Nama', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text(ticket['name'], style: TextStyle(fontSize: 18)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text('Jumlah Tiket', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text(ticket['jumlah'].toString(), style: TextStyle(fontSize: 18)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text('Total Harga', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text(ticket['total_harga'].toString(), style: TextStyle(fontSize: 18)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text('Tanggal', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text(ticket['date'], style: TextStyle(fontSize: 18)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  // create center submit button
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 25, 27, 193),
                            padding: EdgeInsets.only(
                                left: 80, right: 80, top: 15, bottom: 15)),
                        child: const Text(
                          'Done',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Home()));}),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
