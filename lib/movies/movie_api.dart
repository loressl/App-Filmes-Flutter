import 'dart:convert' as convert;

import 'package:app_filmes/movies/api_key.dart';
import 'package:app_filmes/movies/movie.dart';
import 'package:http/http.dart' as http;

class MoviesApi{
  static bool FAKE = false;

  static Future<List<Movie>> getMovies() async{
    final url = "https://api.themoviedb.org/3/movie/popular?api_key=$api_key&language=pt-BR";

    final response = await http.get(url);
    String json = response.body;
    print(json);

    //parser
    final map = convert.json.decode(json);

    final mapMovies = map["results"];

    List<Movie> movies = mapMovies.map<Movie>((json)=>Movie.fromJson(json)).toList();

    return movies;
  }
}
