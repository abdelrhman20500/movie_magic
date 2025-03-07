// import 'package:get_it/get_it.dart';
// import 'package:movie_magic/Features/Movies/data/data_sources/movie_remote_data_source.dart';
// import 'package:movie_magic/Features/Movies/data/repository/movies_repository.dart';
// import 'package:movie_magic/Features/Movies/domain/use_cases/get_now_playing_use_case.dart';
// import 'package:movie_magic/Features/Movies/presentation/view_manger/movies_bloc.dart';
//
// final sl = GetIt.instance;
//
// class ServicesLocator {
//   void init() {
//
//     /// Bloc
//      sl.registerLazySingleton(()=>MoviesBloc(sl()));
//     /// Use Cases
//     sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
//
//
//     /// Repository
//     sl.registerLazySingleton<MoviesRepository>(
//             () => MoviesRepository(sl()));
//
//     /// DATA SOURCE
//     sl.registerLazySingleton<MovieRemoteDataSource>(
//             () => MovieRemoteDataSource());
//   }
// }