import 'package:flutter/material.dart';

class img_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        // width: size.width * 0.4,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
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
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 100),
                    blurRadius: 120,
                    color: Colors.black)
              ]),
            )
          ],
        ));
  }
}
