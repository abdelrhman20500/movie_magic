import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_magic/Features/Movies/domain/entities/genres_entity.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_details_entity.dart';

import 'build_image_movie_details.dart';
import 'build_row_details.dart';

class BuildItemMovieDetails extends StatelessWidget {
  const BuildItemMovieDetails({super.key, required this.movieDetailsEntity,});
  final MovieDetailsEntity movieDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildImageMovieDetails(image: movieDetailsEntity.backdropPath,),
        const SizedBox(height: 6,),
        Text(movieDetailsEntity.title,
            style: GoogleFonts.poppins(
              fontSize: 23,
              color: Colors.white70,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            )),
        const SizedBox(height: 6,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Text("2022",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              const BuildRowDetails(),
              const SizedBox(width: 16.0),
              Text(movieDetailsEntity.releaseDate,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6,),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(movieDetailsEntity.overview,
            maxLines: 4, overflow: TextOverflow.ellipsis,style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
            ),),
        ),
        const SizedBox(height: 6,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Genres: ${_showGenres(movieDetailsEntity.genres)}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }
  String _showGenres(List<GenresEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
