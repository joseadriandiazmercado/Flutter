import 'package:flutter/material.dart';

import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:peliculas/providers/movies_provider.dart';


void main() => runApp(AppState());

// ignore: use_key_in_widget_constructors
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //lazy para mandar a llamar la inicializacion de la class
         ChangeNotifierProvider(create: (_) => MovieProvider(), lazy: false,)
      ], 
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme:ThemeData.dark().copyWith(
        appBarTheme:const AppBarTheme(
          
          color: Colors.blueAccent

        )
      ) ,
    );
  }
}