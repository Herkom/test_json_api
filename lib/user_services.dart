import 'dart:async' show Future;
//import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:test_json_api/user_podo.dart';
import 'package:http/http.dart' as http;


///Cargar el archivo JSON
/*Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/ejemplo_json.json');
}*/

///Cargar la respuesta
Future<UsuariosLista> loadStudent() async {

  ///Cargar el archivo en crudo del JSON
  //String jsonString = await _loadAStudentAsset();

  ///Llamar API
  final jsonString = await http.get('http://200.56.118.30:4200/caosf/2601');
  print('///////////////////////////');
  print(jsonString);
  print('///////////////////////////');
  print('??????????????????????');
  print(jsonString.statusCode);
  print('??????????????????????');

  ///Decodificar el JSON que se cargó
  if (jsonString.statusCode == 200){
    final jsonResponse = json.decode(jsonString.body);

    print('---------------------------');
    print(jsonResponse);
    print('---------------------------');

    ///Descerializamos la respuesta del JSON decodificada para
    ///usar el objeto Usuario y así poder acceder a las entidades.
    UsuariosLista response = new UsuariosLista.fromJson(jsonResponse);

    return response;
  } else {
    throw Exception('Failed to load post');
  }
}