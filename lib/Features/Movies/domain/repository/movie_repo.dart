import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';

abstract class MovieRepo{
  Future<List<MovieEntity>> getNowPlaying();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
}