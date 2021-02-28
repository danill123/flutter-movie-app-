import 'package:flutter/material.dart';
import 'package:flutter_dude/components/Movie_card.dart';
import 'package:flutter_dude/pages/MovieDetail.dart';

class Television extends StatefulWidget {
  @override
  _TelevisionState createState() => _TelevisionState();
}

class _TelevisionState extends State<Television> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
              Text("TV Shows Exploler", style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MovieDetail()));
            },
            child: MovieCard(),
          );
        }),
      ),
    );
  }
}
