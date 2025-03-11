import 'package:movie_magic/Features/Movies/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsState{}
class MovieDetailsInitial extends MovieDetailsState{}
class MovieDetailsLoading extends MovieDetailsState{}
class MovieDetailsFailure extends MovieDetailsState{
  final String errMessage;
  MovieDetailsFailure({required this.errMessage});
}
class MovieDetailsSuccess extends MovieDetailsState{
  final MovieDetailsEntity movieDetailsEntity;

  MovieDetailsSuccess({required this.movieDetailsEntity});
}