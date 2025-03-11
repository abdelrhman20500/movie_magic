import 'package:flutter/cupertino.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/build_see_more_item.dart';

class BuildItemPopularSeeMoreListView extends StatelessWidget {
  const BuildItemPopularSeeMoreListView({super.key, required this.movieEntity});

  final List<MovieEntity> movieEntity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: movieEntity.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: BuildSeeMoreItem(
              title: movieEntity[index].title,
              image: movieEntity[index].backdropPath,
              rating: movieEntity[index].voteAverage.toDouble(),
              overview: movieEntity[index].overview,
              id: movieEntity[index].id,
            ),
          );
        }
    );
  }
}
