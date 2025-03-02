import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required super.id,
      required super.backdropPath,
      required super.title,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json["id"],
      backdropPath: json["backdrop_path"],
      title: json["title"],
      genreIds: List<int>.from(json["genreIds"].map((e) => e)),
      overview: json["overview"],
      voteAverage: json["voteAverage"],
      releaseDate: json["releaseDate"]);
}
