import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies Poster',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: MoviesPage(), // Use stateful widget you created here
    ),
  ));
}

// You are given json string of movies list (see file movies.dart)
String moviesList = MoviesList.moviesJsonList;
// Hint:
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {


  List decodedMoviesList = json.decode(moviesList);

  // A lot of time got wasted here as I tried to convert the list to a map so that each element could be accessed iteratively. But later it occurred that list[][] can access the same

  int movieItemNumber = 1;

  // to track and initiate the next link when the button gets clicked. It's starting with 1 because first link is already provided. Another way to do it was to use the ID. I changed the code to use this.

  var movieLinkId = '038001';

  // first movie link is needed because from setState gets activated only when button gets clicked. For first time , it needs to be provided in raw.

  // below function gets triggered when button gets clicked

  changeMovieLinkId() {

    setState(() {

      // printing each link to the console

        print(decodedMoviesList[movieItemNumber]["id"]);

      // updating movieLink when the button is pressed

        movieLinkId = decodedMoviesList[movieItemNumber]["id"];

    });

    //updating item number in the list so that next link can be accessed

    movieItemNumber = movieItemNumber + 1;

  }

  @override
  Widget build(BuildContext context) {

    return Container(

        child: Column(

                children: <Widget>[

                SizedBox(height: 50),
                Center(
                    child: Container(
                        width: 350, height: 350, child: Image.network('https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture-Kotlin/posters/$movieLinkId.jpg'))),
                SizedBox(height: 50),
                FlatButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: changeMovieLinkId,
                    child: Text(
                        'Next Movie',
          ),
        ),
      ],
    ));
  }
}
