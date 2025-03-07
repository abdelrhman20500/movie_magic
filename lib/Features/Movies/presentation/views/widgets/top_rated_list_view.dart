import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/movie_entity.dart';
import 'build_top_rated_item.dart';

class TopRatedListView extends StatelessWidget {
  const TopRatedListView({super.key, required this.model,});

  final List<MovieEntity>model;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: model.length,
          itemBuilder: (context, index) {
            return BuildTopRatedItem(movie: model[index],);
          },
        ),
      ),
    );
  }
}
