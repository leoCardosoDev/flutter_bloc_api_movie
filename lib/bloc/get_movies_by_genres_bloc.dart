import 'package:flutter/material.dart';
import 'package:movie_api_bloc/models/movie/movie_response.dart';
import 'package:movie_api_bloc/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class MoviesListByGenresBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMoviesByGenres(int id) async {
    MovieResponse response = await _repository.getMovieByGenre(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesListByGenresBloc = MoviesListByGenresBloc();
