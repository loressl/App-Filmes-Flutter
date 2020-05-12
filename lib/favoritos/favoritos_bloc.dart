import 'package:app_filmes/movies/movie.dart';
import 'package:app_filmes/movies/movie_db.dart';
import 'package:app_filmes/utils/simple_bloc.dart';

class FavoritosBloc extends SimpleBloc<List<Movie>>{

  Future fetch({bool isRefresh = false}) async{
    try{
      if(isRefresh)
        add(null);

      final db = MovieDB.getInstance();
      final movies = await db.getMovies();

      add(movies);

      return movies;
    }catch(error, exception){
      print("$error - $exception");
      addError("Nenhum fime nos favoritos.");
    }
  }
}
