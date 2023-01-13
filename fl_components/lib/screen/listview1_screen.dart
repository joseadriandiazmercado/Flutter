// importar una pantalla para comenzar a trabajar
//importM

import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal gear',
    'Super Smash',
    'Final Fantasy'
  ];
  const Listview1Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview tipo 1')),
        body: ListView(
          // El ListView pose un children como row
          children: [
            ...options
                .map((game) => ListTile(
                      title: Text(game),
                      // poner el icono a su derecha
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ))
                .toList() // .tolist para convertit a lista

            //ListTile despues del children (Texto)
            //   ListTile(
            //       title: Text('Hola mundo')),
          ],
        )
        );
  }
}