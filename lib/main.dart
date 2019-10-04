import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

List imgList = new List();
void main() {
  String moviesList = MoviesList.moviesJsonList;
  List decodedMoviesList = json.decode(moviesList);

  int i = 0;
  while(i != decodedMoviesList.length){
    imgList.add(decodedMoviesList[i]["poster"]);
    i++;
  }
  print(imgList);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies Poster',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: CarouselMovies(), // Use stateful widget you created here
    ),
  ));
}

// You are given json string of movies list (see file movies.dart)

// Hint:
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here
List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      child: Image.network(i),
    );
  },
).toList();

class CarouselMovies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 500,
      items: child,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 16/9,
    );
  }
}


