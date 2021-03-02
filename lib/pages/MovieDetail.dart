import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  const MovieDetail({Key key, this.id}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  List genreList = new List();
  Future fetchDetail() async {
    final responses = await Dio().get(
        "https://api.themoviedb.org/3/movie/${widget.id}?api_key=1240a0327275bc49b56f6907d9be7a90&language=en-US");
    return responses;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: fetchDetail(),
      builder: (BuildContext context, snapshot) {
        // check if still loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // check data
        if (snapshot.hasData) {
          var parse_data = json.decode(snapshot.data.toString());
          genreList.addAll(parse_data["genres"]);

          return Container(
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        child: Image.network(
                          "https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces${parse_data["backdrop_path"].toString()}",
                          width: double.infinity,
                          fit: BoxFit.fill,
                          height: size.height * 0.3,
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(left: 10, top: 110),
                              width: size.height * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ]),
                              child: ClipRRect(
                                child: Image.network(
                                    "https://image.tmdb.org/t/p/w200${parse_data["poster_path"].toString()}",
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(20),
                              )),
                          Container(
                            margin: const EdgeInsets.only(left: 5, top: 175),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  child: Text(
                                    parse_data["title"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                  ),
                                  width: 210,
                                ),
                                Text(
                                    "Release Date: ${parse_data["release_date"].toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        decoration: TextDecoration.none)),
                                Text(
                                    "Popularity: ${parse_data["popularity"].toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        decoration: TextDecoration.none)),
                                Text(parse_data["status"].toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        decoration: TextDecoration.none))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // header & basic information movie
                Container(
                    // margin: EdgeInsets.only(left: 30),
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin:
                          const EdgeInsets.only(left: 16, top: 10, right: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Genre:",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none)),
                            Wrap(
                              children: genreList.map((entry) {
                                return Container(
                                    margin:
                                        EdgeInsets.only(right: 5, bottom: 5),
                                    child: Text(entry["name"].toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            decoration: TextDecoration.none)));
                              }).toList(),
                            )
                          ]),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 16, top: 20, right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Overview: ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none)),
                          SizedBox(height: 10),
                          Text(parse_data["overview"].toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  decoration: TextDecoration.none))
                        ],
                      ),
                    )
                  ],
                ))
                // overview & sub movie information
              ],
            )),
          );
        }

        return Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: Text(
            "Please check your internet connection",
            style: TextStyle(
                fontSize: 10,
                decoration: TextDecoration.none,
                color: Colors.black87),
          )),
          decoration: BoxDecoration(color: Colors.white),
        );
      },
    );
  }
}
