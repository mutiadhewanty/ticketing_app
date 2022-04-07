
import 'package:flutter/material.dart';

import '../model/place.dart';
import 'image_card.dart';

class ImageCards extends StatefulWidget {
  const ImageCards({ Key? key }) : super(key: key);

  @override
  State<ImageCards> createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {

  List<Place> places = [
  Place(place: 'Gazebo', image: '1.jpg', days: 7),
  Place(place: 'Gazebo', image: '1.jpg', days: 7),
  Place(place: 'Gazebo', image: '1.jpg', days: 7),
  Place(place: 'Gazebo', image: '1.jpg', days: 7),
  Place(place: 'Gazebo', image: '1.jpg', days: 7),
  
 ];

  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return ImageCard(
                place: places[index],
                name: places[index].place!,
                days: places[index].days!,
                picture: places[index].image!,
              );
            })
    );
  }
}