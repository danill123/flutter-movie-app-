import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Tester with ChangeNotifier {
  int _count = 0;
  Dio _dio = new Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3"));

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void testing() async {
    // change Future for BuildFuture
    final response = await _dio.get(
        "/discover/movie?api_key=1240a0327275bc49b56f6907d9be7a90&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1");
    print(response.data["results"]);
    notifyListeners();
  }

  // void runner() async {
  //   await testing();
  //   notifyListeners();
  // }
}
