import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class MovieAlbum {
  final int id;
  final String title;
  final String year;
  final String rating;
  final String coverImage;


  MovieAlbum({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.coverImage,
  });


  factory MovieAlbum.fromJson(Map<String, dynamic> json) {
    return MovieAlbum(
      id: json['id'],
      title: json['title'],
      year: json['year'].toString(), // Convert to string
      rating: json['rating'].toString(), // Convert to string
      coverImage: json['medium_cover_image'], // Correct key
    );
  }
}

  Future<List<MovieAlbum>> fetchMovies() async{
    final response = await http.get(Uri.parse('https://yts.mx/api/v2/list_movies.json?quality=3D'));
    if(response.statusCode == 200){
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> moviesJason = data['data']['movies'];
      return moviesJason.map((json) => MovieAlbum.fromJson(json)).toList();

    }
    else {
      throw Exception('Failed to load movies');
    }
  }