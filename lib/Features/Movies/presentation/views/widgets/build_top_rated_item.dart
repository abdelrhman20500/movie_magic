import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_magic/Features/Movies/presentation/views/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../Core/utils/app_constant.dart';
import '../../../domain/entities/movie_entity.dart';

class BuildTopRatedItem extends StatelessWidget {
  const BuildTopRatedItem({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>
         MovieDetailsScreen(id: movie.id)));
        },
        child: ClipRRect(
          borderRadius:
          const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: AppConstant.imageUrl(movie.backdropPath),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
