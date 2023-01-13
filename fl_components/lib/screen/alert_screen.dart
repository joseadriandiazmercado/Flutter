
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AlertScreen extends StatelessWidget {
   const AlertScreen({Key? key}) : super(key: key);


    //  Alerta para los Sistemas IOS
  void displayDialogIOS(BuildContext context){
    showCupertinoDialog(
      barrierDismissible:false,
     context: context,
     builder: (context){
      return  CupertinoAlertDialog( 
          title: const Text('Alerta'),
          content: Column(
            children: const [
              Text('Este es el contenido de la Alerta'),
              SizedBox(height: 10,),
              FlutterLogo(size: 50,)
            ]
            ),
            actions: [
              TextButton(onPressed: (() => Navigator.pop(context)),
              child:const Text('Close', style:TextStyle(color: Colors.red) )
              ),
              TextButton(onPressed: (() => Navigator.pop(context)) ,
               child: const Text('OK'))
            ],
      );
     }
     );  
    }

  //Alerta para los sistemas Andriod
  //Creacion de una funcion
  //Se requiere del context por que StatelessWidget no lo posee
  void displayDialogAndroid(BuildContext context){

  // Creacion del dialogo.
  showDialog(
    barrierDismissible: false,//Alerta desasparesca dando click en la sombra
    context: context, 
    builder: (context) {
      return AlertDialog(
        //Start, darle bordes a la tarjeta
        clipBehavior:Clip.antiAlias,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(18 )),
        //End, darle bordes a la tarjeta
        elevation: 5,
        title: const Text('Alert'),
        content: Column(
          //Tamano de la alerta mediante los hijos
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Este es el contenido de la alerta'),
            SizedBox(height: 10,),
            FlutterLogo(size: 50,)
          ],
        ),
        actions: [
          TextButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
             child: const Text('Cancelar')
             ),
             TextButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
             child: const Text('OK')
             )
        ],
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
         child: ElevatedButton(
          // Se puede sobreescibir el estilo del Bottom
          // style: ElevatedButton.styleFrom(
          //         primary: Colors.red,
          //         shape:const StadiumBorder(),
          //         elevation: 0,
          //       ),
            //Cuando se presione, ajecuta  la funcion  displayDialog()
            //Platform para desplegar el alertdialog dependiendo del sistema
          onPressed: () => Platform.isAndroid?
          displayDialogAndroid(context):
          displayDialogIOS(context),
            child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text('Mostrar Alerta', style:TextStyle(fontSize: 16) ,),
          ),
         ),
      ),
      floatingActionButton:
       FloatingActionButton(
        // ignore: sort_child_properties_last
        child: const Icon(Icons.close),
        onPressed:(() {
          //bote la ultima pantalla que esta en el stack de cartas
          //Retroceder una pagina para atras
          Navigator.pop(context);
        }
        ) 
    )
    );
  }
}