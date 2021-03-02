import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api extends ChangeNotifier {
  Dio _dio = new Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3"));
  List listTrending = new List();
  List movieExploler = new List();
  List tvExploler = new List();
  bool errorStatus = false;
  bool loadingStatus = false;

  /* increment field */
  int increMoviePage = 1;
  int increTvPage = 1;

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

  void fetchMovie() async {
    try {
      loadingStatus = true;
      final response = await _dio.get(
          "/discover/movie?api_key=1240a0327275bc49b56f6907d9be7a90&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=${increMoviePage}");
      increMoviePage++;
      movieExploler.addAll(response.data["results"]);
      errorStatus = false;
    } catch (e) {
      errorStatus = true;
    } finally {
      loadingStatus = false;
      notifyListeners();
    }
  }

  void fetchTvShow() async {
    try {
      loadingStatus = true;
      final response = await _dio.get(
          "/discover/tv?api_key=1240a0327275bc49b56f6907d9be7a90&language=en-US&sort_by=popularity.desc&page=${increTvPage}&timezone=America/New_York&include_null_first_air_dates=false");
      increTvPage++;
      tvExploler.addAll(response.data["results"]);
      errorStatus = false;
    } catch (e) {
      errorStatus = true;
    } finally {
      loadingStatus = false;
      notifyListeners();
    }
  }
}
