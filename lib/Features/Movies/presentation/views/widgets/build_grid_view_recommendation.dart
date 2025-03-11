import 'package:flutter/material.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_recommendation_entity.dart';

import 'build_item_recommendation.dart';

class BuildGridViewRecommendation extends StatelessWidget {
  const BuildGridViewRecommendation({super.key, required this.model,});

  final List<MovieRecommendationEntity> model;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 0.7,
      crossAxisCount: 3,
    ),
        itemCount: model.length,
        shrinkWrap: true, // Allow the GridView to take only the space it needs
        physics: const NeverScrollableScrollPhysics(), // Disable its own scrolling
        itemBuilder: (context, index){

          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: BuildItemRecommendation(image: model[index].backdropPath,),
          );
        }
    );
  }
}
