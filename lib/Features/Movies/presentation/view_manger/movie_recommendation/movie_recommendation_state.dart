import 'package:movie_magic/Features/Movies/domain/entities/movie_recommendation_entity.dart';

abstract class MovieRecommendationState{}
class MovieRecommendationInitial extends MovieRecommendationState{}
class MovieRecommendationLoading extends MovieRecommendationState{}
class MovieRecommendationFailure extends MovieRecommendationState{
  final String errMessage;
  MovieRecommendationFailure({required this.errMessage});
}

class MovieRecommendationSuccess extends MovieRecommendationState{
  final List<MovieRecommendationEntity> model;

  MovieRecommendationSuccess({required this.model});
}