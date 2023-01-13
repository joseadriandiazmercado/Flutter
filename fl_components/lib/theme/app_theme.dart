// Creacion de los temas globales de la aplicacion
// Esta clase tambien se puede utilizar para darle estilo a 
// botones, mas widget, ETC.
// Ir agregando AQUI lo que quieres que tenga un tema global

import 'package:flutter/material.dart';

class AppTheme{
//Tipo color
  static const Color primary = Colors.cyanAccent;
 // ThemeData Defines the configuration of the overall visual [Theme] for
 // a [MaterialApp] or a widget subtree within the app.
  static final ThemeData darkTheme = ThemeData.dark().copyWith( 
          //Color primario
          primaryColor: Colors.indigo,
          //AppBar theme
          appBarTheme:const AppBarTheme(
            color: primary,
            elevation: 0,
            ),
  //          //TextButton Theme
            textButtonTheme:TextButtonThemeData(
              // ignore: deprecated_member_use
              style:TextButton.styleFrom(primary: primary)),
  //            //FloatingActionBottomd
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: primary),
              
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: primary,
                  shape: const StadiumBorder(),
                  elevation: 0,
                )
                ),
  
  //            //inputDecorationTheme
                inputDecorationTheme: const InputDecorationTheme(
                  floatingLabelStyle: TextStyle(color: primary),
                   enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primary),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                   ),
                   focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primary),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                   ),
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                   )
                ),
            );           
}
