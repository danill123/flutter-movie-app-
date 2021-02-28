import 'package:flutter/material.dart';
import 'package:flutter_dude/components/card_img.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map> myProducts =
      List.generate(4, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   leading: Text('menu'),
      // ),
      body: Column(
        children: <Widget>[
          Container(
            // it will cover 20% of our screens
            height: size.height * 0.4,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                      color: Colors.green[600],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hello I\'m Danill',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 54,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Colors.black.withOpacity(0.23))
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            // child: Container(
            //   alignment: Alignment.center,
            //   child: Text('sadasd'),
            //   decoration: BoxDecoration(
            //       color: Colors.amber, borderRadius: BorderRadius.circular(15)),
            // ),
            child: new Expanded(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this would produce 2 rows.
                crossAxisCount: 2,
                // Generate 100 Widgets that display their index in the List
                children: List.generate(10, (index) {
                  // return img_card();
                  return Container(
                      margin: EdgeInsets.all(5),
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/plants_tree.png",
                            height: 140,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text('Plants tree'),
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 100),
                                      blurRadius: 120,
                                      color: Colors.black)
                                ]),
                          )
                        ],
                      ));
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
