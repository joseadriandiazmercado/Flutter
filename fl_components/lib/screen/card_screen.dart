

import 'package:flutter/material.dart';


import 'package:fl_components/widgets/widgets.dart';


class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Card Widget'),
      ),
      body: ListView(
        //Agregar paddign a la tarjeta(Card)
        padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
        children:const [
          //Creacion de widget que se puede reutilizar las veces deseadas
          //CustomdCardType1 creacion de widget en la parte de abajo
          CustomdCardType1(),
          //Separacion entre las tarjetas
          SizedBox(height: 10,),
          CustomCardType2(imageUrl: 'https://img.freepik.com/free-vector/nature-scene-with-river-hills-forest-mountain-landscape-flat-cartoon-style-illustration_1150-37326.jpg?w=2000',name: 'Vista de lago con luna',),
          SizedBox(height: 10,),
          CustomCardType2(imageUrl: 'https://www.creativefabrica.com/wp-content/uploads/2021/03/13/beautiful-landscape-in-sunset-Graphics-9546561-1.jpg',name: 'Puesta de sol',),
          SizedBox(height: 10,),
          CustomCardType2(imageUrl: 'https://cdn.theatlantic.com/media/img/photo/2020/11/top-shots-2020-international-landsc/a01_Yuen_MagicalNight-1/original.jpg',),
          SizedBox(height: 10,),
         Center(
          child:
          Text('Nothing To Show')
          ),
        ],
      )
    );
  }
}