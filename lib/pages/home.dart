import 'package:flutter/material.dart';
import 'package:flutter_dude/components/Movie_card.dart';
import 'package:flutter_dude/pages/MovieDetail.dart';

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Movie Exploler", style: TextStyle(color: Colors.black)),
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
