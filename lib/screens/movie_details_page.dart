import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yts_movie_app/Services/movie_album.dart';
class DetailScreen extends StatefulWidget {
 final String movieId;

 DetailScreen({
   required this.movieId,
});
  @override
  State<DetailScreen> createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  late Future<MovieAlbum> fetchDetails;
  @override
  void initState(){
    super.initState();
    fetchDetails= fetchMovieDetails(widget.movieId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("YTS Movies",selectionColor: Colors.greenAccent,),
        foregroundColor: Colors.greenAccent,
        backgroundColor: Colors.black,
        toolbarHeight: 50,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search),
            tooltip: 'search ',
          ),
          IconButton(onPressed: (){},
            icon: Icon(Icons.person),
          ),


        ],
        leading: IconButton(
          onPressed:(){},
          icon: Icon(Icons.menu),
          tooltip: 'Menu',
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,

      ),
      body: FutureBuilder<MovieAlbum>(
        future: fetchDetails,
        builder:(context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"),);
          }
          final movie = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.network(movie.coverImage),
                Text(movie.title),
                Text(movie.year),
                Text(movie.rating),
                Text(movie.description),
              ],
            ),
          );
        }
      ),

  floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back),
  ),

    );
  }
}
