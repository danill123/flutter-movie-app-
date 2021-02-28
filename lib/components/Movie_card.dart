import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// only for grid view list
class MovieCard extends StatelessWidget {
  final String imageUrl;

  const MovieCard({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 40, right: 40, bottom: 8, top: 2),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ]),
        child: ClipRRect(
          child: Image.network("https://image.tmdb.org/t/p/w200${imageUrl}",
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20),
        ));
  }
}
