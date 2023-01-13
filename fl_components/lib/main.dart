import 'package:flutter/material.dart';

import 'package:fl_components/router/app_routes.dart';
import 'package:fl_components/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // cuando corra la aplicacion 
        // home: const CardScreen(),
         // Esta es la ruta principal con la que arrancara la aplicacion
        initialRoute: AppRoutes.initialRoute,
        // routes para pedir las rutas de las otras pantallas
        //routes se verefica primero
        routes: AppRoutes.getAppRoutes(),
        // no genera una ruta, esto por que ya exite en tus rutas 
        // tener en cuenta es un error conocido
        // Generar una ruta alterna por falla de buscar
        onGenerateRoute: AppRoutes.onGenerateRoute,
        //colocar el tema global de la aplicacion
        // .copyWith() Tomar una copia del theme y sobreescribir los parametros que tu quieres.      
        theme: AppTheme.darkTheme,
        );
  }
}