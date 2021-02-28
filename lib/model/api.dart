import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api extends ChangeNotifier {
  Dio _dio = new Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3"));
  List listTrending = new List();
  bool errorStatus = false;
  bool loadingStatus = false;

  void fetchTrending() async {
    try {
      loadingStatus = true;
      final response = await _dio.get(
          "/discover/movie?api_key=1240a0327275bc49b56f6907d9be7a90&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1");
      listTrending = response.data["results"];
      errorStatus = false;
    } catch (e) {
      errorStatus = true;
    } finally {
      loadingStatus = false;
      notifyListeners();
    }
  }
}
