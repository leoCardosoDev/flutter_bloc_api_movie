import 'package:movie_api_bloc/models/genre/genre_response.dart';
import 'package:movie_api_bloc/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class GenresListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<GenreResponse> _subject =
      BehaviorSubject<GenreResponse>();

  getGenres() async {
    GenreResponse response = await _repository.getGenres();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GenreResponse> get subject => _subject;
}

final genresListBloc = GenresListBloc();
