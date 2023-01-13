import 'package:flutter/material.dart';


//this. dinamico
class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
     this.hintText,
     this.labelText,
     this.helperText,
     this.icon,
     this.suffixIcon,
     this.keyboardType,
     //Si no se envia la contrasena, por defecto es false
     this.obscureText = false,
     required this.formProperty,
     required this.formValues,})  : super(key: key);

    final String? hintText;
    final String? labelText;
    final String? helperText;
    final IconData? icon;
    final IconData? suffixIcon;
    final TextInputType? keyboardType;
    final bool obscureText;

    final String formProperty;
    final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     //Ingresar directamente al input
     autofocus: false,
     //Modificar el tipo de teclado para correos electronicos
     keyboardType:keyboardType,
     //Ocultar la contrasena con asterisco
     obscureText: obscureText,
     textCapitalization:TextCapitalization.words,
     //Almacenar el valor de la varible
     onChanged: (value) => formValues[formProperty] = value,
     //Validacion del formulario
     //Requisitos que debe de tener
      validator: (value) {
        if(value == null) return 'Este campo es requerido';
        //Validacion de minimo 3 caracteres con operador ternario
        //Regresa null por que si paso la validacion
          return value.length < 3 ? 'Minimo de 3 letras requerido' : null;
       },
       //Validacion del formulario
       //Hasta que el usurario interactua con el Input
       autovalidateMode: AutovalidateMode.onUserInteraction,
       //Dar estilo al Input
       decoration: InputDecoration(
         // hintText = PlaceHolder
         hintText:hintText ,
         //Por encima del hintText
         labelText:labelText,
         //Ayudar al usuario a los datos
         helperText:helperText,
         //suffixIcon al lado de los los parametros al final derecha
         suffixIcon: suffixIcon == null ? null :Icon(suffixIcon),
         //Icono al lado de los los parametros al final izquierda
         icon: icon == null ? null : Icon(icon),
         // focusedBorder: OutlineInputBorder(
         //   borderSide: BorderSide(
         //     color: Colors.green   
         //   )
         // ),
         // Dar un border a al intup
         // cerrarlo en un Box
       // border: OutlineInputBorder(
       //     borderRadius: BorderRadius.only(
       //     bottomLeft: Radius.circular(10),
       //     topRight: Radius.circular(10),
       //     )
       //   )
        ),
       );
      }
    }