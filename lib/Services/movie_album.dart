import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class MovieAlbum {
  final int id;
  final String title;
  final String year;
  final String rating;
  final String coverImage;
  final String description;


  MovieAlbum({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.coverImage,
    required this.description,
  });


  factory MovieAlbum.fromJson(Map<String, dynamic> json) {
    return MovieAlbum(
      id: json['id'],
      title: json['title']??'Unknown title',
      year: json['year'].toString(), // Convert to string
      rating: json['rating'].toString(), // Convert to string
      coverImage: json['medium_cover_image']?? '',
      description: json['description']??'No Description',
    );
  }
}

  Future<List<MovieAlbum>> fetchMovies() async {
    final response = await http.get(
        Uri.parse('https://yts.mx/api/v2/list_movies.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> moviesJason = data['data']['movies'];
      return moviesJason.map((json) => MovieAlbum.fromJson(json)).toList();
            }
    else {
      throw Exception('Failed to load movies');
            }
}
    Future<MovieAlbum> fetchMovieDetails(String movieId)async{
      final response = await http.get(
          Uri.parse('https://yts.mx/api/v2/movie_details.json?movie_id=$movieId') // Use movieId
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);


        final movieData = data['data']['movie']; // Access the 'movie' part
        if (movieData != null) {
          return MovieAlbum.fromJson(movieData);
        } else {
          throw Exception('No movie data found in response');
        }

      } else {
        throw Exception('Failed to load movie details: ${response.statusCode}');
      }
    }

    