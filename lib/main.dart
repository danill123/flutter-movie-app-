import 'package:flutter/material.dart';
import 'package:flutter_dude/model/api.dart';
import 'package:flutter_dude/pages/MovieApp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => Api())
  ], child: movieApp()));
}
