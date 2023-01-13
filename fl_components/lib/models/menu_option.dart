// Nuestro menu de rutas
import 'package:flutter/material.dart';

class MenuOption{
//La ruta a donde se va a dirigir
  final String  route;
//Icono de ka ruta en especifico
  final IconData icon;
//Nombre de la ruta
  final String name;
//Pantalla de la ruta que va a mostrar
  final Widget screen;
// Requerimientos para utilizar MenuOption
  MenuOption({
    // Menu de opciones donde todas son requeridas.
    //Se colocan entre llaves para que el orden sea aleatorio, pero siempre requeridas.
    required this.route,
    required this.icon,
    required this.name,
     required this.screen});
}