import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticketing_app/views/checkoutTicket.dart';
import 'package:ticketing_app/views/home.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class OrderTicket extends StatefulWidget {
  @override
  State<OrderTicket> createState() => _OrderTicketState();
}

class _OrderTicketState extends State<OrderTicket> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _dateController = TextEditingController();

  TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    _timeController.text = "";
    super.initState();
  }

  var _count = 0;
  var sum = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      _count--;
    });
  }

  void _totalBayar() {
    setState(() {
      sum = _count * 10000;
    });
  }

  final String url = 'http://10.0.2.2:8000/api/ticketing';
  Future saveOrder() async {
    final response = await http.post(Uri.parse(url), body: {
      "name": _nameController.text,
      "date": _dateController.text,
      "waktu": _timeController.text,
      "jumlah": _count.toString(),
      "total_harga": sum.toString()
    });
    print(response.body);

    return json.decode(response.body);
  }

  Future getTicket() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: size.width,
        height: size.height,
        child: Form(
          key: _formKey,
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
                              "Order Ticket",
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
                            'https://images.unsplash.com/photo-1530631673369-bc20fdb32288?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Harga',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Rp$sum',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Container(
                    height: 60.0,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukkan nama";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Container(
                    height: 60.0,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly: true,
                        controller: _dateController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.date_range),
                          border: InputBorder.none,
                          hintText: "Date",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukkan Tanggal Kunjungan";
                          }
                          return null;
                        },
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          _dateController.text =
                              date.toString().substring(0, 10);
                        },
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                //   child: Container(
                //     height: 60.0,
                //     width: size.width,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10.0),
                //       color: Colors.white,
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.all(8.0),
                //       child: TextFormField(
                //         controller: _timeController,
                //         decoration: InputDecoration(
                //           suffixIcon: Icon(Icons.access_time),
                //           border: InputBorder.none,
                //           hintText: "Waktu Kunjungan",
                //           hintStyle: TextStyle(
                //             color: Colors.grey,
                //           ),
                //         ),
                //         readOnly: true,
                //         onTap: () async {
                //           TimeOfDay? pickedTime = await showTimePicker(
                //             initialTime: TimeOfDay.now(),
                //             context: context,
                //           );

                //           if (pickedTime != null) {
                //             print(pickedTime.format(context));
                //             DateTime parsedTime = DateFormat.jm()
                //                 .parse(pickedTime.format(context).toString());

                //             print(parsedTime);
                //             String formattedTime =
                //                 DateFormat('HH:mm:ss').format(parsedTime);
                //             print(formattedTime);

                //             setState(() {
                //               _timeController.text = formattedTime;
                //             });
                //           } else {
                //             print("Time is not selected");
                //           }
                //         },
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return "Masukkan waktu kunjungan";
                //           }
                //           return null;
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.remove,
                            size: 30,
                            color: Colors.blue.shade900,
                          ),
                          onPressed: () {
                            _decrementCount();
                            if (_decrementCount.toString().isEmpty) {
                              print(_count);
                            } else {
                              _totalBayar();
                            }
                          }),
                      Text(
                        '${_count}',
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.blue.shade900,
                          ),
                          onPressed: () {
                            _incrementCount();
                            if (_decrementCount.toString().isEmpty) {
                              print(_count);
                            } else {
                              _totalBayar();
                            }
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FutureBuilder(
                    future: getTicket(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 300,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue.shade900),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        saveOrder();
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return CheckoutTicket(
                                            ticket: snapshot.data['data']
                                                [index],
                                          );
                                          
                                        }));
                                      }
                                    },
                                    child: Text(
                                      'Pesan',
                                      style: TextStyle(fontSize: 18),
                                    )),
                              );
                            });
                      } else if (snapshot.hasError) {
                        children = <Widget>[
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text('Error: ${snapshot.error}'),
                          )
                        ];
                      } else {
                        children = const <Widget>[
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          )
                        ];
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: children,
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
