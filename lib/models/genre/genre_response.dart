import 'genre.dart';

class GenreResponse {
  final List<Genre> genres;
  final String error;

  GenreResponse({this.genres, this.error});

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genres = (json['genres'] as List)
            .map((index) => Genre.fromJson(index))
            .toList(),
        error = "";

  GenreResponse.withError(String errorValue)
      : genres = List(),
        error = errorValue;
}
