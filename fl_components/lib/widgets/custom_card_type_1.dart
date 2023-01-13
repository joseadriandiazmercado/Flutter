//widget independiente

import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';


class CustomdCardType1 extends StatelessWidget {
  const CustomdCardType1({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:[
         const ListTile(
            leading: Icon(Icons.credit_card, color:AppTheme.primary),
            title: Text('Title'),
            subtitle: Text('Veniam id culpa ullamco nisi tempor consequat. Consectetur incididunt irure consequat eiusmod sunt veniam. Exercitation deserunt aliquip ea cillum aute commodo ut velit.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5,),
            child: Row( 
              // MainAxisAlignment (mover los objetos)
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                  TextButton(
                    //Funcion que no retorna nada
                   onPressed: () {},
                   //Darle estilos al boton
                   // ignore: deprecated_member_use                
                   child:const Text('Cancel'),
                   ),
                   TextButton(
                   onPressed: () {},
                   //Propiedad Style.
                   //Reutilizado de Apptheme.dart
                   // ignore: deprecated_member_use
                   child:const Text('Ok'))
              ],
            ),
          )
        ]
      ),
    );
  }
}
//End_file