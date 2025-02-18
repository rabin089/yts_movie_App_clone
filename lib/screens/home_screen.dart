import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yts_movie_app/Services/movie_album.dart';
import 'package:yts_movie_app/Services/movie_album.dart' as widget;
import 'package:yts_movie_app/screens/search_screen.dart';
import 'package:yts_movie_app/screens/movie_details_page.dart';

class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState()=> HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  late Future<List<MovieAlbum>> fetchData;
  @override
   void initState(){
    super.initState();
    fetchData = fetchMovies();
  }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: FutureBuilder<List<MovieAlbum>>(
        future: fetchData,
        builder: (context, snapshot){
         if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No movies found'));
          }
          final movie = snapshot.data!;
            return Column(
              children: [
                Text(
                    "Welcome to Yts Movies",
                    style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                ),
                SizedBox(height: 10,),
                Text(
                  "Explore the Latest movies and Tv Shows",
                  style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10,),
                
                Expanded(child:GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.55,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(movieId: movie[index].id.toString())));
                  },

                child:  Card(
                  elevation: 4.0,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        movie[index].coverImage,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        movie[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(movie[index].year,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                      ),
                      // Text(movie.rating,
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(color: Colors.white),
                      // ),
                           ],
                         ),
                      ),
                );
                    },
                  ),
                ),
          ],
            );
        },

      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        ),
      );
  }
}

