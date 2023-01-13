
import 'package:flutter/material.dart';

import 'dart:math';
// StatefulWidget poder cambiar los estados
class AnimatedScreen extends StatefulWidget {  
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  //Tipo de dato
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(18);


class _AnimatedScreenState extends State<AnimatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  title: const Text('AnimatedScreen'),
),
      body: Center(
         child: AnimatedContainer(
          
          width: _width,
          height: _height,          
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ), 
          duration: const Duration(seconds: 1),
           curve: Curves.bounceOut,
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //setState para cambiral el estado de los valores
          //Cambiaron propiedades, redibuja el widget
          setState(() {
            // Random(); mandar numeros al azar
            final random = Random();
              // nuevos valores de _width
              // random.nextInt(Hasta la maxima cantidad que tu desees)
              // y convertilo nuevamente a double.
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

             // Cambio de color a cualquiera dentro del RGB0 de 255
            _color = Color.fromRGBO(
              random.nextInt(255),
              random.nextInt(255),
              random.nextInt(255),
              1
            );
            _borderRadius =
            BorderRadius.circular(random.nextInt(100).toDouble() + 10 );
          }
          );
        },        
        child: const Icon(Icons.play_arrow), 
      ),
    );
  }
} 