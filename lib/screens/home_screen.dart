import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class HomeScreen extends StatelessWidget {
final List<Map<String, dynamic>> movies = [
  {'title':'Openheimer','poster':'https://image.tmdb.org/t/p/w200/ptpr0kGAckfQkJeJIt8st5dglvd.jpg'},
   {'title': 'Mario Bros', 'poster': 'https://image.tmdb.org/t/p/w200/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg'},
    {'title': 'The Batman', 'poster': 'https://image.tmdb.org/t/p/w200/74xTEgt7R36Fpooo50r9T25onhq.jpg'},
    {'title': 'Avatar 2', 'poster': 'https://image.tmdb.org/t/p/w200/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg'},
  {'title': 'Inception', 'poster': 'https://image.tmdb.org/t/p/w200/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg'},
  {'title': 'Interstellar', 'poster': 'https://image.tmdb.org/t/p/w200/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg'},
  {'title': 'The Dark Knight','poster':'https://yts.mx/assets/images/movies/the_dark_knight_2008/medium-cover.jpg'},

];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
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
      body:  SingleChildScrollView(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(15.0),
          child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to YTS Movies",style: TextStyle(color: Colors.lightBlue,fontSize: 20,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  "Explore the latest movies and TV shows",style: TextStyle(color: Colors.blueAccent,fontSize: 15),
                ),
              ],
          ),
           ),
          SizedBox(height: 20,),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.6, // Give height to GridView
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          movies[index]['poster']!,
                          fit: BoxFit.cover,
                          height: 250, // Fixed height for the image
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        movies[index]['title']!,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                )
              
          )
          
        ],
      )
          
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

