import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_json_api/user_podo.dart';
import 'package:test_json_api/user_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.white,
        child: Center(
          child: FutureBuilder<UsuariosLista>(
            future: loadStudent(),
            builder: (context, snapshot){
              if(snapshot.hasData && snapshot.data.usuarios[0].status){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: NetworkImage('${snapshot.data.usuarios[0].foto}'),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      snapshot.data.usuarios[0].nombre,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              } else{
                return CircularProgressIndicator();
              }
            },
          )
        )
      )
    );
  }
}

