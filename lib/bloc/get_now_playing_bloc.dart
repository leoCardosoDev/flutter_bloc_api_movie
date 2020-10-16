import 'package:movie_api_bloc/models/movie/movie_response.dart';
import 'package:movie_api_bloc/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class NowPlayingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMoviesByGenres() async {
    MovieResponse response = await _repository.getPlaying();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final nowPlayingListBloc = NowPlayingListBloc();
