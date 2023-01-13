
import 'package:fl_components/models/models.dart';
import 'package:flutter/material.dart';
import 'package:fl_components/screen/screen.dart';

class AppRoutes{

  static const initialRoute = 'home';

  //Esto es una lista de menuOptions  
  static final menuOptions = <MenuOption> [
    // crear lo que es el MenuOption para ir creando mas rutas si este lo requiere  
    // vamos a darles todos los disenos a todas la rutas de la aplicacion
    // el nombre de la ruta es la misma que como esta predeterminado en las rutas
    // name (opcional), se requiere pero el nombre asignado es como aparece en la aplicacion
    // screen es llamar la funcion de la ruta
    // icon, el icono que le vas a dar a la ruta
    // MenuOption(route: 'home',      name: 'Home Screen',     screen: const HomeScreen(),      icon: Icons.home,),
    MenuOption(route: 'listview1',       name: 'Listview tipo 1',                   screen: const Listview1Screen(),       icon: Icons.looks_one_outlined,),
    MenuOption(route: 'listview2',       name: 'Listview tipo 2',                   screen: const Listview2Screen(),       icon: Icons.looks_two_outlined,),
    MenuOption(route: 'card',            name: 'Card screen',                       screen: const CardScreen(),            icon: Icons.category,),
    MenuOption(route: 'alert',           name: 'Alertas',                           screen: const AlertScreen(),           icon:Icons.warning,),
    MenuOption(route: 'avatar',          name:'Circule Avatar',                     screen: const AvatarScreen(),          icon: Icons.account_circle_outlined),
    MenuOption(route: 'animated',        name: 'Animated Screen',                   screen: const AnimatedScreen(),        icon: Icons.animation_outlined),
    MenuOption(route: 'input',           name: 'Text Inputs',                       screen: const InputScreen(),           icon: Icons.input),
    MenuOption(route: 'slider',          name: 'Slider && Checks',                  screen: const SliderScreen(),          icon: Icons.linear_scale_outlined),
    MenuOption(route: 'listViewBuilder', name: 'InfiniteScroll & Pull to refresh',  screen: const ListViewBuilderScreen(), icon: Icons.build_rounded),
  ];

  // lo siguiene es para poder llamar las rutas en el main
  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
      Map<String, Widget Function(BuildContext)> appRoutes = {};
      // Que no aparezca en la pantalla de inicio, pero que si se pueda interactuur con ella.
      appRoutes.addAll({'home':(BuildContext context) => const HomeScreen()});
      // for para iterar en todo, final variable, in 'nombre de donde vas a iterar'
    for(final option in menuOptions) {
      appRoutes.addAll({option.route: ( BuildContext context) => option.screen});
    }
    // y retorna las rutas
    return appRoutes;
  }
        // Generar una ruta alterna por falla de buscar
        // no se coloca lo que es el settings, por que lo toma como referencia 
        // en dado caso de que no, poner un funcion de flecha 
  static Route<dynamic>? onGenerateRoute (RouteSettings settings)  {
          return  MaterialPageRoute(
              builder: (context) => const AlertScreen()
              );
        }
}