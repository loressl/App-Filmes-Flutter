import 'movie_api.dart';
import 'package:app_filmes/utils/simple_bloc.dart';

class MoviesBloc extends SimpleBloc{

  Future fetch({bool isRefresh = false}) async{
    try{
      if(isRefresh)
        add(null);

      final movies = await MoviesApi.getMovies();

      add(movies);
    }catch(error){
      addError("Nenhum Filme!!");
    }
  }
}
