import 'package:flutter/material.dart';
import 'package:flutter_dude/components/Movie_card.dart';
import 'package:flutter_dude/model/api.dart';
import 'package:flutter_dude/pages/MovieDetail.dart';
import 'package:provider/provider.dart';

class trending extends StatefulWidget {
  @override
  _trendingState createState() => _trendingState();
}

class _trendingState extends State<trending> {
  @override
  Widget build(BuildContext context) {
    final restApi = Provider.of<Api>(context);

    if (restApi.listTrending.isEmpty) {
      restApi.fetchTrending();
    }

    Widget viewChecked() {
      if (restApi.listTrending.isNotEmpty) {
        return GridView.count(
            crossAxisCount: 2,
            children: restApi.listTrending.map((item) {
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
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(
          child: Text("Trending Movie", style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: viewChecked(),
    );
  }
}
