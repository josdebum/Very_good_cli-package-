import 'package:bloc/bloc.dart';
import 'package:my_app/cubits/states.dart';
import 'package:my_app/service/repository.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.repository}) : super(InitialState()) {
    getTrendingMovies();
  }

  final MovieRepository repository;

  //The function will be the constructor to load the movies at class instantiation.
  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await repository.getMovies();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}