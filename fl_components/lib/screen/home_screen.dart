import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';
import 'package:fl_components/router/app_routes.dart';
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold( // Scaffold no puede ser const
 // el appBar depende del espacio de la pantalla, no const
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HOME'),    
      ),
      body:
      ListView.separated(
        //Lo que va a constuir
        itemBuilder: (context, i) =>  ListTile(
          //Cuanto estas iterando, se debe de poner el i, por la posicion donde esta
          leading: Icon(menuOptions[i].icon, color: AppTheme.primary,),
          // Nombre de las rutas
          title: Text(AppRoutes.menuOptions[i].name),
          onTap: () {
            // ignore: unnecessary_string_interpolations
            Navigator.pushNamed(context, '${menuOptions[i].route}');
          },
        ),
         separatorBuilder:(BuildContext context,i) => const Divider (),
         //Numero de las rutas
         itemCount: menuOptions.length)
    );
  }
}