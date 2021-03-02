import 'package:flutter/material.dart';
import 'package:flutter_dude/components/Movie_card.dart';
import 'package:flutter_dude/model/api.dart';
// import 'package:flutter_dude/pages/MovieDetail.dart';
import 'package:flutter_dude/pages/tvShowDetail.dart';
import 'package:provider/provider.dart';

class Television extends StatefulWidget {
  @override
  _TelevisionState createState() => _TelevisionState();
}

class _TelevisionState extends State<Television> {
  ScrollController _scrollListener = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final restApi = Provider.of<Api>(context);

    // if data was already have, user no need fetch data again
    if (restApi.tvExploler.isEmpty) {
      restApi.fetchTvShow();
    }

    // check if scrool was most bottom position & will do fetch more data
    _scrollListener.addListener(() {
      if (_scrollListener.position.pixels ==
          _scrollListener.position.maxScrollExtent) {
        restApi.fetchTvShow();
      }
    });

    Widget viewCheck() {
      if (restApi.tvExploler.isNotEmpty) {
        return GridView.count(
          crossAxisCount: 2,
          controller: _scrollListener,
          children: restApi.tvExploler.map((item) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => tvShowDetail(
                              id: item["id"],
                            )));
              },
              child: MovieCard(
                imageUrl: item["poster_path"],
              ),
            );
          }).toList(),
        );
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
              Text("TV Shows Exploler", style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: viewCheck(),
    );
  }
}
