//var url = Uri.https('example.com', 'whatsit/create');

import 'package:flutter/material.dart';

//Libreria importada en PUB.DEV
import 'package:http/http.dart' as http;

import 'package:peliculas/models/models.dart';


//Clase global
//ChangeNotifier
class MovieProvider extends ChangeNotifier{

  final String _apiKey = '9b8924465d534eeee6654875da18439f';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  //DOnde vamos a almacenar todas las peliculas
  List<Movie> onDisplayMovies = [];
  
  List<Movie> popularMovies = [];

//incrementar la pagina y hacer el infinityScroll
  int _popularPage = 0;


//Esto es lo que corre
//Constructor
MovieProvider(){
  getOnDisplayMovies();
  getPopularMovies();
}



//El valor de la pagina es opcional y si no manda nada es "1"
Future<String> _getJsonData(String endpoint ,)async{
var url = Uri.https(_baseUrl, endpoint, 
  //parametros del Query, Como estan en postan
    {
  'api_key': _apiKey,
  'language': _language,
  
    }
  );    
    // Obtener los resultados
    //Hacer la peticion http
    final response = await http.get(url);
    return response.body;
}



//Future, peticion HTTP
getOnDisplayMovies() async{

  final jsonData = await _getJsonData('3/movie/now_playing');


    //Convertirlo a un objeto
    //Map<String, dynamic> pasar estos parametros por que no sabe en que  
    //esta codificando, las llaves seran String y sus datos Cualquiera
    //// final Map<String, dynamic> decodedData =  json.decode(response.body);
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    // ignore: unnecessary_this
    this.onDisplayMovies = nowPlayingResponse.results;

      //Redibujar los widgets
      notifyListeners();
      }


  //async por que tiene que hacer peticiones http
  getPopularMovies()async{
    

  final jsonData = await _getJsonData('/3/movie/popular', );
    
    _popularPage++;
    //Convertirlo a un objeto
    //Map<String, dynamic> pasar estos parametros por que no sabe en que 
    //esta codificando, las llaves seran String y sus datos Cualquiera
    // final Map<String, dynamic> decodedData =  json.decode(response.body);

    final popularResponse = PopularResponse.fromJson(jsonData);


    
    popularMovies = [...popularMovies, ...popularResponse.results];

      //Redibujar los widgets
      notifyListeners();
    
    }
 } 