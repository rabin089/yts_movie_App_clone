import 'package:flutter/material.dart';
import 'package:yts_movie_app/screens/home_screen.dart';

class SearchPage extends SearchDelegate<String>{
  final List<dynamic> moviesList;
  SearchPage(this.moviesList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(
      onPressed: (){},
      icon:Icon(Icons.clear),
    ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Back button to close search
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close search
      },
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    final results = moviesList
        .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]); // Close search with result
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = moviesList
        .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context); // Show selected result
          },
        );
      },
    );
  }


  
}