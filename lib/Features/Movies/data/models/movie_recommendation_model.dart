import 'package:movie_magic/Features/Movies/domain/entities/movie_recommendation_entity.dart';

class MovieRecommendationModel extends MovieRecommendationEntity {
  const MovieRecommendationModel(
      {required super.backdropPath, required super.id});
  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
          backdropPath: json["backdrop_path"], id: json["id"]);
}
