import 'package:flutter/material.dart';
import 'package:movie_api_bloc/bloc/get_genres_bloc.dart';
import 'package:movie_api_bloc/models/genre/genre.dart';
import 'package:movie_api_bloc/models/genre/genre_response.dart';
import 'genre_list.dart';

class GenresWidget extends StatefulWidget {
  @override
  _GenresWidgetState createState() => _GenresWidgetState();
}

class _GenresWidgetState extends State<GenresWidget> {
  @override
  void initState() {
    super.initState();
    genresListBloc..getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genresListBloc.subject.stream,
      builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget();
          }
          return _buildGenresWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget();
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildGenresWidget(GenreResponse data) {
    List<Genre> genres = data.genres;
    print(genres);
    if (genres.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return GenresList(
        genres: genres,
      );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container();
  }
}
