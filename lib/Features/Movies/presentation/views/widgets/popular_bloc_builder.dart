import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_magic/Features/Movies/data/repository/movies_repository.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/popular_cubit/popular_cubit.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/popular_cubit/popular_state.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/popular_list_view.dart';


class PopularBlocBuilder extends StatelessWidget {
  const PopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularCubit(GetPopularMoviesUseCase(MoviesRepository(MovieRemoteDataSource())))..getPopular(),
      child: BlocBuilder<PopularCubit, PopularState>(
        builder: (context, state) {
          if (state is PopularLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PopularFailure) {
            // print(state.errMessage);
            return Center(child: Text('Error: ${state.errMessage}'));
          } else if (state is PopularSuccess) {
            return PopularListView(model: state.movie); // Pass the movie list
          }
          return Container();
        },
      ),
    );
  }
}


