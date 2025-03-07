import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';

abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedFailure extends TopRatedState {
  final String errMessage;
  TopRatedFailure({required this.errMessage});
}

class TopRatedSuccess extends TopRatedState {
  final List<MovieEntity> movie;

  TopRatedSuccess({required this.movie});
}
