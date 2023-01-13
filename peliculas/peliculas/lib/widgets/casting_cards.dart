import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CastingCards extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        //Poder hacer scroll para los costados
        //Dentro del LIstView
        scrollDirection:Axis.horizontal ,
        itemBuilder: (_, int index) => _CastCard(),
      ),
    );
  }
}


class _CastCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Esto es el contenedor
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            //Estas son las cartas del casting
            child: const FadeInImage(
              height: 140,
              width: 100,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/no-image.jpg'),
              image:AssetImage('assets/no-image.jpg'),
                ),
          ),
          const SizedBox(height: 5,),
          const Text(
            'actor.name jefjejkfef ejfekjfefj',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}