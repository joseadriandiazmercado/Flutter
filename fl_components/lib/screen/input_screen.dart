import 'package:flutter/material.dart';

import '../widgets/widgets.dart';



class InputScreen extends StatelessWidget {   
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final GlobalKey<FormState> myFormKy = GlobalKey<FormState>();

    //Almacenar los datos del formulario
    final Map<String, String> formValues = {
      //String vacios para almacenar los datos del usuario
      'first_name': '',
      'last_name' : '',
      'email'     : '',
      'password'  : '',
      'role'      : 'Admin',
  };
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Inputs y Forms'),
      ),
      // SingleChildScrollView trabaja como una lsita para poder
      // hacer scroll, pero de solo un objeto
      body: SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //toddo en un mismo form 
        child: Form(
          //Validar los valores de cada uno TextFormField
          key: myFormKy,
          child: Column(
            children: [
              //TextFormField tiene mas interaciones con un formulario
              //Validaciones.
                CustomInputField(labelText: 'Nombre',
                hintText: 'Nombre del usuario',
                helperText: 'Nombre del usuario',
                suffixIcon:(Icons.group),
                formProperty: 'first_name',
                formValues: formValues,),
                const SizedBox(height: 20,),
                  CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido del usuario',
                  helperText: 'Apellido del usuario',
                  formProperty: 'last_name',
                  formValues: formValues,
                  ),
                  const SizedBox(height: 20,),
                  //Validacion para el email con teclado funcial de tipo:email
                  CustomInputField(
                    keyboardType:TextInputType.emailAddress,
                    labelText: 'Correo',
                    hintText: 'Correo Electronico',
                    helperText: 'Correo Electronico',
                    formProperty: 'email',
                    formValues: formValues,),
                    const SizedBox(height: 20,),
                  CustomInputField(
                    labelText: 'Contrasena', 
                    obscureText: true,
                    formProperty: 'password',
                    formValues: formValues,
                    ),

                    const SizedBox(height: 20,),
                  //Selector de rango de usurarios
                  DropdownButtonFormField(
                  items:const[
                    //Creacion de una lista
                      DropdownMenuItem(value:'Admin',child: Text('Admin'),),
                      DropdownMenuItem(value:'Superuser',child: Text('Superuser'),),
                      DropdownMenuItem(value:'Developer',child: Text('Developer'),),
                      DropdownMenuItem(value:'User',child: Text('User'),),
                  ], 
                  onChanged: (value) { 
                      print(value);
                  // Apuntar al objeto y su key role, y darle le valor de Admin 
                  //-?? si no hay nada, que por defecto sea null
                      formValues['role'] = value ?? 'Admin';
                   },
                  ),
                  
                    const SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed:(){
                        //Esconder el teclado cuando se presione el boton guardar
                        FocusScope.of(context).requestFocus(FocusNode());

                        //i! decir que siempre se va a tener ese punto
                        if(!myFormKy.currentState!.validate()){
                          print('formulario no valido');
                          return;
                        }
                        //* Imprimir los valores del formulario
                        print('Role ${formValues}');
                      },
                     child:const SizedBox(
                      width: double.infinity,
                      child: Center(
                      child: Text('SAVE'))))
                ],
              ),
        ),
          ),
        ),
    );
  }
}