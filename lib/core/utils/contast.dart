import 'package:flutter/material.dart';

class Constant {
  static const String baseurl = 'https://api.themoviedb.org/3';
  static const String Apikey = '31b5689d4369d4d956cfd3dcc968d2d0';
  static const String nowplayingmovie =
      '${baseurl}/movie/now_playing?api_key=${Apikey}';

  static const String popularmovie =
      '${baseurl}/movie/popular?api_key=${Apikey}';

  static const String toprealted =
      '${baseurl}/movie/top_rated?api_key=${Apikey}';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageurl(String path) => '$baseImageUrl$path';
}
