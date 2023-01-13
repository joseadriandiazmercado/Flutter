import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


// ignore: use_key_in_widget_constructors
class DetailsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

  //Cambiar por una instancia de movie
  //Obtener los algumentos de las peliculas
  final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie'; 

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //*******APPBAR********//
          _CustomAppBar(),
          //Poder ingresar una lista en los Slivers
          SliverList(
            //SliverChildListDelegate con este Widget ya se puede hacer una lista
            //DE widget estaticos
            delegate: SliverChildListDelegate([

                _PosterAndTitle(),
                _Overview(),
                _Overview(),
                _Overview(),
                CastingCards()
            ]
           )
          )
        ],
      )
    );
  }
}


//WIDGET PRIVADOS _
class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Exactamente como un Appbar, pero este permite mover el Appbar
    //SliverAppBar
    //Nuevo AppBar que baja cuando el usuario esta iterando con la parte de abajo.
    return SliverAppBar(
      
              backgroundColor: Colors.blueAccent, 
              //tamano del AppBar
              expandedHeight: 200,
              //Que el SliverAppBar regrese 
              floating: false,
              //Que nunca desasparesca, llegue a un punto arriba y se atore
              pinned: true,
              //Amoldear el texto cuando el appbar tenga una interaccion
              flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              //Quitar el padding del Container de la parte de abajo
              titlePadding:const EdgeInsets.all(0),
              title: Container(
                color: Colors.black12,
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  padding:const EdgeInsets.only(bottom: 10),
                  child: const
                  Text(
                    'Movie.tilte', style: TextStyle(fontSize: 16),),
              ),
              background: const FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover, 
        ),
      ),
    );
  }
} 

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        //Row para poner alementos al lado del otro
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage( 
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSdTbhQGxTkYXcniXJGxkpG-LBAGZjyor4tARUP-HNSkcbHKC72'),
                height: 150,
              ),
            ),
            
            const SizedBox(width: 20,),

            Column(
              //Aliniacion de los textos
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Theme en el texto para dar estilo global a los Text.
                Text('movie.title',
                 style: textTheme.headline5,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 2,),
                 Text('movie.originalTitle',
                 style: textTheme.subtitle1,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 1,),
                 Row(
                  children: const [                      
                    Icon(Icons.star_outline,size: 15, color: Colors.grey,),
                    SizedBox(width: 5,),
                    //Agregar al text de abajo style: Theme.of(context).textTheme.caption 
                    Text('movie.voteAverage',),
                  ],
                 )
              ],
            )
        ],
      ),
    );
  }
}


class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Est in cillum minim excepteur consequat exercitation culpa. Irure ullamco nisi incididunt adipisicing ut. Dolore elit nisi ipsum et ad exercitation esse cupidatat tempor esse. Nostrud minim eiusmod id id sint enim sunt dolore eiusmod. Ut excepteur deserunt ex et sunt mollit eiusmod eu nisi pariatur nulla est sit et. Ipsum laboris cillum laborum excepteur nisi eiusmod eu deserunt.',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
        ),
    );
  }
}
