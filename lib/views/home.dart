import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_app/views/orderTicket.dart';

import '../widgets/categorie_card.dart';
import '../widgets/image_card.dart';
import '../widgets/images_card.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          color: Colors.blueGrey.shade50,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only( top: 10, left: 20),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Best ',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 44, 39, 191))),
                            TextSpan(text: 'Experience\nFor Your Happiness')
                          ],
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 24),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://tv-fanatic-res.cloudinary.com/iu/s--KsaMOQ1r--/t_full/cs_srgb,f_auto,fl_strip_profile.lossy,q_auto:420/v1614349785/wanda-maximoff-wandavision-season-1-episode-8.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // controller: searchController,
                          decoration: InputDecoration(

                              hintText: 'Search',


                              border: InputBorder.none),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Search(
                            //               searchQuery: searchController.text,
                            //             )));
                          },
                          child: Container(child: Icon(Icons.search)))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CategorieCard(
                  text: 'All',
                ),
                CategorieCard(
                  text: 'Indoor',
                ),
                CategorieCard(
                  text: 'Outdoor',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Best Experiences',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  icon: Icon(

                    Icons.airplane_ticket,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => OrderTicket(),
            ));
                  },

                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: Container(child: ImageCards())),
            SizedBox(
              height: 30,
            ),

            // Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         IconButton(
            //             icon: Icon(
            //               Icons.home,
            //               color: Color.fromARGB(255, 37, 27, 176),
            //               size: 30,
            //             ),
            //             onPressed: () {}),
            //         IconButton(
            //             icon: Icon(
            //               Icons.search,
            //               color: Colors.black,
            //               size: 30,
            //             ),
            //             onPressed: () {}),
            //         IconButton(
            //             icon: Icon(
            //               Icons.favorite_border,
            //               color: Colors.black,
            //               size: 30,
            //             ),
            //             onPressed: () {}),
            //         IconButton(
            //             icon: Icon(
            //               Icons.person_outline,
            //               color: Colors.black,
            //               size: 30,
            //             ),
            //             onPressed: () {}),
            //       ],
            //     )
            //     )
          ]),
        )));
  }
}
