import 'package:flutter/material.dart';
import 'package:flutter_dude/components/Movie_card.dart';
import 'package:flutter_dude/model/api.dart';
import 'package:flutter_dude/pages/MovieDetail.dart';
import 'package:provider/provider.dart';

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  ScrollController _scrollListener = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final restApi = Provider.of<Api>(context);

    // if data was already have, user no need fetch data again
    if (restApi.movieExploler.isEmpty) {
      restApi.fetchMovie();
    }

    // check if scrool was most bottom position & will do fetch more data
    _scrollListener.addListener(() {
      if (_scrollListener.position.pixels ==
          _scrollListener.position.maxScrollExtent) {
        restApi.fetchMovie();
      }
    });

    Widget viewCheck() {
      if (restApi.movieExploler.isNotEmpty) {
        return GridView.count(
            controller: _scrollListener,
            crossAxisCount: 2,
            children: restApi.movieExploler.map((item) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                id: item["id"],
                              )));
                },
                child: MovieCard(
                  imageUrl: item["poster_path"],
                ),
              );
            }).toList());
      }

      if (restApi.loadingStatus) {
        return Center(child: CircularProgressIndicator());
      }

      return Center(child: Text("Please Check Your Internet Connection"));
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child:
                Text("Movie Exploler", style: TextStyle(color: Colors.black)),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: viewCheck());
  }
}
