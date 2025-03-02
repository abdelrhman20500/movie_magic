import 'package:dartz/dartz.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import '../../../../Core/error/failure.dart';

abstract class MovieRepo{
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
}