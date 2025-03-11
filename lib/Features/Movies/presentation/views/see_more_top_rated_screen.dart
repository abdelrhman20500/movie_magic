import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/top_rated_cubit/top_rated_cubit.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/top_rated_cubit/top_rated_state.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/build_item_popular_see_more_list_view.dart';
import '../../data/data_sources/movie_remote_data_source.dart';
import '../../data/repository/movies_repository.dart';

class SeeMoreTopRatedScreen extends StatelessWidget {
  const SeeMoreTopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios),color: Colors.white70,),
          centerTitle: true,
          title: const Text("Top Rated Movies", style: TextStyle(color:Colors.white70, fontSize: 22, fontWeight: FontWeight.w700),),
        ),
        body: BlocProvider(
          create: (context) => TopRatedCubit(GetTopRatedMoviesUseCase(MoviesRepository(MovieRemoteDataSource(),),),
          )..getTopRated(),
          child: BlocBuilder<TopRatedCubit, TopRatedState>(
            builder: (context, state) {
              if (state is TopRatedLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TopRatedFailure) {
                // print(state.errMessage);
                return Center(child: Text('Error: ${state.errMessage}'));
              } else if (state is TopRatedSuccess) {
                return BuildItemPopularSeeMoreListView(movieEntity: state.movie,); // Pass the movie list
              }
              return Container();
            },
          ),
        )
    );
  }
}

