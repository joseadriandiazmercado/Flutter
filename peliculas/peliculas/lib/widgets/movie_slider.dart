import 'package:flutter/material.dart';

import '../models/models.dart';

// ignore: use_key_in_widget_constructors
class MovieSlider extends StatelessWidget {
//Tipo de dato Movie de su class 
final List<Movie> movies;
//Recuerda el tipo de dato, en este caso es un string
final String? title;

  const MovieSlider({
  super.key, 
  this.title,
  required this.movies 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Expandir todo lo que pueda a un costado
      width: double.infinity,
      height:260,
      child: Column(
        //"Populares"
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: 
                Text(title!, 
                  style: 
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 5,),
  // Se requiere Expanded para que tome como medida la pantalla
            Expanded(
              child: ListView.builder(
                //Para que los Containers se desplacen para los lados
                //Y no de arriba para abajo
                scrollDirection: Axis.horizontal,
                itemCount:movies.length,
                //Arrow funtion para regresar directamente el widget
                //iterando en movie en el index
                itemBuilder: (_, int index) =>  _MoviePoster(movies[index]),
              ),
            ),
          ]
        ),
      );
    }
  }



  class _MoviePoster extends StatelessWidget {
  //Variable de tipo pelicula.
  final Movie movie;

  const _MoviePoster(
    this.movie);

    @override
    Widget build(BuildContext context) {
      //Contenedor
      return Container(
                width: 110,
                height: 190,
                margin:const EdgeInsets.symmetric(horizontal: 10,),
                //Se requiere de una columna para widget encima de otros 
                child: Column(
                  children: [
                    //Poder colocarlo onTap para una interacion
                     GestureDetector(
                      //Navegador de rutas
                      onTap: () => Navigator.pushNamed(context, 'details',
                      arguments: 'movie-instance'),
                      // Hacer los poster con las esquinas redondeadas 
                       child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        //Movie_slider......
                         child: FadeInImage(
                          width: 130,
                          height: 190,
                          fit: BoxFit.cover,
                          placeholder: const AssetImage('assets/no-image.jpg'),
                           image: NetworkImage('${movie.fullPosterImg}'),
                           ),
                        ),
                      ),

                      const SizedBox(height: 5,),
                       Text(
                        //De la clase de Movie, extraemos el movie y de alli sus propiedades 
                        //Que en ella contiene el title
                       movie.title,
              //Indica que hay mas texto pero ya no puede redendizarlo "......"
                        overflow: TextOverflow.ellipsis,
              //Cuando ya no hay espacio, que cree otra linea
                        maxLines: 2,
                        textAlign: TextAlign.center,
                    )
                  ],
                ),
        );
}
}