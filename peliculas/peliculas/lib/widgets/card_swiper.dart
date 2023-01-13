import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import '../models/models.dart';

// ignore: use_key_in_widget_constructors
class CardSwiper extends StatelessWidget {

//Tipo de dato Movie de su class 
    final List<Movie> movies;

  const CardSwiper({
    super.key, 
    required this.movies});

  @override
  Widget build(BuildContext context) {
    // Toddo se agrupara en un container
    // que se podra desplzar el catalogo
     
  // saber el ancho y largo de la pantalla del dispositivo
  // hacer dinamica
  final size = MediaQuery.of(context).size;

  //Mostrar un spinner de un circulo hasta que cargue la imagen
  // ignore: unnecessary_this, prefer_is_empty
  if(this.movies.length == 0){
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height:size.height* 0.5,
      child: const Center(
        child: CircularProgressIndicator(),
        ),
    );
  }

    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,// Toddo el ancho posible de la pantalla
      height: size.height * 0.5 ,
      child: Swiper(
        itemCount: movies.length,
        //Interface del slider
        //Para que tome los valores de width y height y no se expanda todo para los costados
        layout: SwiperLayout.STACK,
        // ancho del cardswiper
        itemWidth: size.width * 0.6,
        // largo del cardswiper
        itemHeight: size.height* 0.5,
        //Contructor (Builder)
        itemBuilder: (_, index) {
          //index es el iterador de movies
          //movies es variable tipo Movie
          //Movie es un class con todos los tados de las peliculas.
        final movie = movies[index];
        //Debe de regresar algo, debe de regresar un widget
        return  GestureDetector(
          onTap: () => Navigator.pushNamed(context,
           'details', arguments: 'movie-instance'),
          //Poner bordes a los cuadros de las imagenes
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            //FadeInImage para las imagenes
            child: FadeInImage(
              // imagen que se va a mostrar mientras carga la imagen 
              placeholder:const AssetImage('assets/no-image.jpg'),
              //Imagen a mostrar.
              image: NetworkImage('${movie.fullPosterImg}'),
              //Llenar todo la imagen con el container padre
              fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}