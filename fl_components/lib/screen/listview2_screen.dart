// importar una pantalla para comenzar a trabajar
//importM
// fl-screen para poner el estilo predeterminado

// ignore_for_file: avoid_print

import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  //Array donde se tiene las opciones de juegos
  final options = const [
    'Megaman',
    'Metal gear',
    'Super Smash',
    'Final Fantasy'
  ];
  const Listview2Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //all va dentro de un scaffold
        appBar: AppBar(
          centerTitle: true,
            title: const Text('Lista de juegos'),
        ),
        body: ListView.separated(
          //Lo que va a redendizar
            itemBuilder: (context, i) => ListTile(
                  title: Text(options[i]),
                  // poner el icono a su izquierda
                  trailing: const Icon(Icons.arrow_forward_ios_outlined, color:AppTheme.primary),
                  onTap: () { // onTap para interactual con las listas
                    final game = options[i]; // game de options en la posicion del indexs
                    print(game);
                  },
                ),
                //Como se va a separar la lista
            separatorBuilder: (context, i) => const Divider(),
            //Numero de la lista
            itemCount: options.length
            )
          );
  }
}