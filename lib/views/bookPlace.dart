import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class BookPlace extends StatefulWidget {
  final Map place;

  BookPlace({required this.place});

  @override
  State<BookPlace> createState() => _BookPlaceState();
}

class _BookPlaceState extends State<BookPlace> {
  final _formKey = GlobalKey<FormState>();
  @override

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
      sum = _count;
    });
  }

  final String url = 'http://10.0.2.2:8000/api/booking';

  Future saveOrder() async {
    final response = await http.post(Uri.parse(url), body: {
      "name": _nameController.text,
      "date": _dateController.text,
      "waktu": _timeController.text,
      "jumlah_orang": _count.toString(),
      // "total_harga": sum.toString()
    });
    print(response.body);

    return json.decode(response.body);
  }

  Future getBook() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // getPlaces();
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
                              "Book a Place",
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
                            'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'),
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
                            widget.place['image']),
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
                        'Jumlah Orang ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '$_count orang',
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
                        controller: _timeController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.access_time),
                          border: InputBorder.none,
                          hintText: "Waktu Kunjungan",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime != null) {
                            print(pickedTime.format(context));
                            DateTime parsedTime = DateFormat.jm()
                                .parse(pickedTime.format(context).toString());

                            print(parsedTime);
                            String formattedTime =
                                DateFormat('HH:mm:ss').format(parsedTime);
                            print(formattedTime);

                            setState(() {
                              _timeController.text = formattedTime;
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukkan waktu kunjungan";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
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
                // FutureBuilder(
                //     future: getBook(),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<dynamic> snapshot) {
                //       List<Widget> children;
                //       if (snapshot.hasData) {
                //         return ListView.builder(
                //             shrinkWrap: true,
                //             itemCount: 1,
                //             itemBuilder: (context, index) {
                //               return SizedBox(
                //                 width: 300,
                //                 height: 50,
                //                 child: ElevatedButton(
                //                     style: ElevatedButton.styleFrom(
                //                         primary: Colors.blue.shade900),
                //                     onPressed: () {
                //                       if (_formKey.currentState!.validate()) {
                //                         saveOrder();
                //                         // Navigator.push(context,
                //                         //     MaterialPageRoute(
                //                         //         builder: (context) {
                //                         //   return CheckoutTicket(
                //                         //     ticket: snapshot.data['data']
                //                         //         [index],
                //                         //   );
                                          
                //                         // }));
                //                       }
                //                     },
                //                     child: Text(
                //                       'Pesan',
                //                       style: TextStyle(fontSize: 18),
                //                     )),
                //               );
                //             });
                //       } else if (snapshot.hasError) {
                //         children = <Widget>[
                //           const Icon(
                //             Icons.error_outline,
                //             color: Colors.red,
                //             size: 60,
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(top: 16),
                //             child: Text('Error: ${snapshot.error}'),
                //           )
                //         ];
                //       } else {
                //         children = const <Widget>[
                //           SizedBox(
                //             width: 60,
                //             height: 60,
                //             child: CircularProgressIndicator(),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.only(top: 16),
                //             child: Text('Awaiting result...'),
                //           )
                //         ];
                //       }
                //       return Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: children,
                //         ),
                //       );
                //     }),
                
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 25, 27, 193),
                          padding: EdgeInsets.only(
                              left: 80, right: 80, top: 15, bottom: 15)),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        saveOrder();
                        
                      }),
                )
              ],
            ),
          )),
    ));
  }
}
