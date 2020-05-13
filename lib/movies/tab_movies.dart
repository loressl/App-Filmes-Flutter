import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_page.dart';
import 'movies_bloc.dart';
import 'package:app_filmes/utils/nav.dart';
import 'package:app_filmes/widgets/text_empty.dart';
import 'package:app_filmes/widgets/text_error.dart';

class TabMovies extends StatefulWidget {
  @override
  _TabMoviesState createState() => _TabMoviesState();
}

class _TabMoviesState extends State<TabMovies> with AutomaticKeepAliveClientMixin<TabMovies> {

  @override
  bool get wantKeepAlive => true;

  final bloc = BlocProvider.getBloc<MoviesBloc>();

  @override
  void initState() {
    super.initState();
    bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot){
        if(snapshot.hasError){
          //erro
          return Center(
            child: TextError(
              snapshot.error,
              onRefresh: _onRefreshError,
            ),
          );
        }

        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Movie> movies = snapshot.data;
        return movies.isEmpty ? TextEmpty("Nenhum filme."):_griView(movies, context);
      },
    );
  }

  _griView(List<Movie> movies, context){
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: GridView.builder(
        gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: movies.length,
          itemBuilder: (context, index){
            return _item(movies, index, context);
          },
      ),
    );
  }

  _item(List<Movie> movies, index, context){
    Movie m = movies[index];
    //tag para a animação do hero
    m.tag = m.title;

    return Material(
      child: InkWell(
        child: Hero(
          tag: m.tag,
          child: Image.network(
            m.urlFoto,
            fit: BoxFit.cover,
          ),
        ),
        onTap: (){
          _onClickMovie(m);
        },
      ),
    );
  }

  void _onClickMovie(Movie m){
    push(context, MoviePage(m));
  }

  Future<void> _onRefresh(){
    return bloc.fetch();
  }

  Future<void> _onRefreshError(){
    return bloc.fetch(isRefresh: true);
  }
}
