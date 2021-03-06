import 'package:flutter/material.dart';
import 'package:flutter_dude/pages/Trending.dart';
import 'package:flutter_dude/pages/home.dart';
import 'package:flutter_dude/pages/television.dart';

class movieApp extends StatefulWidget {
  @override
  _movieAppState createState() => _movieAppState();
}

class _movieAppState extends State<movieApp> {
  int tabIndex = 1;
  List<Widget> listScreens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listScreens = [trending(), Homes(), Television()];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: listScreens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined), title: Text("Trending")),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.tv_outlined), title: Text("TV"))
          ],
        ),
      ),
    );
  }
}
