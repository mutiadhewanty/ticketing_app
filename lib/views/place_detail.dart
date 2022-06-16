import 'package:flutter/material.dart';
import 'package:ticketing_app/main.dart';
import 'package:ticketing_app/views/bookPlace.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:unique_list/unique_list.dart';

class DetailScreen extends StatelessWidget {
  final Map place;

  DetailScreen({required this.place});

  final String url = 'http://10.0.2.2:8000/api/places';

  Future getPlaces() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(place['image']))),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        // margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white)),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Rp ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black87),
                                  children: [
                            TextSpan(
                              text: place['price'],
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            )
                          ]))),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      // margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white)),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              place['name'],
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
          SizedBox(height: 3,),
          
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17),
            child: Text(place['description'],
              style: TextStyle(
                color: Colors.black26
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: Text('A comfortable and very spacious place, suitable for meetings that can accommodate many people. Having an elegant impression is very suitable if holding a formal or informal event. With a very beautiful outdoor view.'),
          ),
          SizedBox(height: 8,),
          Center(
            child: 
                FutureBuilder(
                    future: getPlaces(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount:  1,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 100,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue.shade900),
                                    onPressed: () {
                                      
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return BookPlace(
                                            place: snapshot.data['data'][index]
                                                ,
                                          );
                                          
                                        }));
                                      
                                    },
                                    child: Text(
                                      'Pesan',
                                      style: TextStyle(fontSize: 18),
                                    )),
                              );
                            }
                            );
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
                  // child: ElevatedButton(
                  //                 onPressed: () {
                  //                   Navigator.push(
                  //                 context, MaterialPageRoute(builder: (_) => {}));
                  //                 },
                  //                 child: Text('Add'),
                  //                 style: ElevatedButton.styleFrom(
                  //                     primary: Colors.black87,
                  //                     fixedSize: const Size(250, 40),
                  //                     shape: RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.circular(50))),
                                
                ),
        ] 
            )
              
          
      )
      ),
    );
  }
}
