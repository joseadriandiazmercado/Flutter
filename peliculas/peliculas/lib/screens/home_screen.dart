
import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';


// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    //listen: true para redibujar 
    final moviesProvider = Provider.of<MovieProvider>(context);


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
           onPressed: () {},
           icon: const Icon(Icons.search_outlined)
           )
        ],
      ),
      //Se pone columna por que por que permite poner diferentes widgets
      body: SingleChildScrollView(
        child: Column(
          children: [
                // Toddo: CardSwiper
                    CardSwiper(
                      movies: moviesProvider.onDisplayMovies),
              // Listado Horizontal de peliculas.
              // Listado Horizontal de peliculas.
              // Listado Horizontal de peliculas.
              // Listado Horizontal de peliculas.
              const SizedBox(height: 20,),
                    MovieSlider(
                      movies: moviesProvider.popularMovies,
                       title: 'Populares!', //populares
                       //opcional
                    ),
          ],
        ),
      )
    );
  }
}