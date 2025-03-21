import 'package:flutter/material.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/bloc_builder_movie_details.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/bloc_builder_movies_recommendation.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilderMovieDetails(id: id),
            const SizedBox(height: 16.0),
            Text(
              "More like this".toUpperCase(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
                letterSpacing: 1.2,
              ),
            ),
            BlocBuilderMoviesRecommendation(id: id),
          ],
        ),
      ),
    );
  }
}