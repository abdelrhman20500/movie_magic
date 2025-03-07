import 'package:flutter/material.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/build_row_item.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/now_playing_bloc_builder.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/popular_bloc_builder.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/top_rated_bloc_builder.dart';


class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: const SingleChildScrollView(
        key: Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NowPlayingBlocBuilder(),
            BuildRowItem(title: "Popular",subTitle: "see More",),
            PopularBlocBuilder(),
            BuildRowItem(title: "Top Rated",subTitle: "see More",),
            TopRatedBlocBuilder(),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}





