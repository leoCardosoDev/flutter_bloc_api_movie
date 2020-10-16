import 'package:flutter/material.dart';
import 'package:movie_api_bloc/bloc/get_movies_by_genres_bloc.dart';
import 'package:movie_api_bloc/models/genre/genre.dart';
import 'package:movie_api_bloc/widgets/genres/genre_movies.dart';
import '../../style/theme.dart' as Style;

class GenresList extends StatefulWidget {
  final List<Genre> genres;

  GenresList({@required this.genres});

  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  _GenresListState(this.genres);
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: genres.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        moviesListByGenresBloc..drainStream();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307,
      child: DefaultTabController(
        length: genres.length,
        child: Scaffold(
          backgroundColor: Style.Colors.mainColor,
          body: TabBarView(
            controller: _tabController,
            children: genres
                .map((Genre genre) => GenreMovies(genreId: genre.id))
                .toList(),
          ),
        ),
      ),
    );
  }
}
