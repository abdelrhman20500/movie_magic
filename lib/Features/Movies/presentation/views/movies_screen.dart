import 'package:flutter/material.dart';
import 'package:movie_magic/Features/Movies/presentation/views/see_more_popular_screen.dart';
import 'package:movie_magic/Features/Movies/presentation/views/see_more_top_rated_screen.dart';
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
      body:  SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingBlocBuilder(),
            BuildRowItem(title: "Popular",subTitle: "see More",
            onSeeMoreTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SeeMorePopularScreen()));
            },),
            const PopularBlocBuilder(),
            BuildRowItem(title: "Top Rated",subTitle: "see More",
              onSeeMoreTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SeeMoreTopRatedScreen()));
              },),
            const TopRatedBlocBuilder(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}





