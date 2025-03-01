import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final List<int> genreIds;
  final String overview;
  final int voteAverage;

  const MovieEntity({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        backdropPath,
        title,
        genreIds,
        overview,
        voteAverage,
      ];
}
