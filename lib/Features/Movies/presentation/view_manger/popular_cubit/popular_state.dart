import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';

abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularFailure extends PopularState {
  final String errMessage;
  PopularFailure({required this.errMessage});
}

class PopularSuccess extends PopularState {
  final List<MovieEntity> movie;

  PopularSuccess({required this.movie});
}
