import 'package:flutter/material.dart';
import 'package:fl_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
    //Valor inicial
    double _sliderValue = 100; 
    bool _sliderEnabled = false;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Slider && Checks'),
      ),
      body: Column(
        children: [
      //.adaptive para que se adapte al sistema de Android o IOS
          Slider.adaptive(
            label: 'Modificar Imagen',

            //Definir los valores maximos y minimos
            min:50,
            max:400,
            activeColor: AppTheme.primary,
            // divisions: 5,
            autofocus: true,
            //Parte que no sido seleccionada
            //Parte restante.
            inactiveColor: Colors.red,
            //Cambiar la apariencia del mouse
            mouseCursor: MouseCursor.defer,
            
            value: _sliderValue,

            onChanged: _sliderEnabled ? (value) {
              // Sobreescribir el valor de _sliderValue
               setState(() {
               _sliderValue = value; 
      
               });
            }
            : null
          ),

          // Checkbox(
            
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     setState(() {
          //       _sliderEnabled = value ?? true;
          //     });
          //   }
          //   ),

          // Switch(
          //   value: _sliderEnabled, 
          //   onChanged: (value) {
          //       setState(() {
          //         // Siempre se espera un valor bool
          //         _sliderEnabled = value;
          //       });
          //    }
          //   ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 200),
            child: CheckboxListTile(
              activeColor: AppTheme.primary,
              title: const Text('Habilitar Slider'),
              value: _sliderEnabled,
              onChanged: ( value ) {
                //Recuerda el setState
                setState(() {
                _sliderEnabled = value ?? true;  
                });
              }
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(left: 15, right: 200),
          child: SwitchListTile(
            activeColor: AppTheme.primary,
            title:const Text('Habilitar Slider'),
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value;
                }
               );
              }
            ),
         ),
         //Para mostrar licencias
         const AboutListTile(),
          // Expanded para que tome el resto de la columna
           Expanded(
            //SingleChildScrollView Widget
            //SingleChildScrollView si la imagen es mas grande que la pantalla
            // permitira hacer scroll a la misma para no marcar error
             child: SingleChildScrollView(
               child: Image(
                image: const NetworkImage('https://www.pngplay.com/wp-content/uploads/6/Batman-Comics-Transparent-PNG.png'),
                fit: BoxFit.contain,
                //La imagen va en aumento, debido a que cambia el valor del 
                // _sliderValue 
                width: _sliderValue,
               ),
             ),
           ),
        ],
      )
    );
  }
}