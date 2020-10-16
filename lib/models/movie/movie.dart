class Movie {
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String overview;
  final String rating;

  Movie({
    this.id,
    this.popularity,
    this.title,
    this.backPoster,
    this.overview,
    this.rating,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'],
        title = json['title'],
        backPoster = json['backPoster'],
        overview = json['overview'],
        rating = json['vote_average'].toDouble();
}
