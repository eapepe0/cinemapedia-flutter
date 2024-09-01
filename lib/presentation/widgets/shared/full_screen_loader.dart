import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  // funcion stream , que cada 2.5 seg devuelve un mensaje de la lista messages
  Stream<String> getLoadingMessages(){
    final messages = <String>[
      'Cargando peliculas',
      'Sacando la entrada',
      'Comprando los pochoclos',
      'Se apaga la luz de la sala',
      'Ya comienza la pelicula',
      'Esta tardando mas de lo esperado'
    ];

    return Stream.periodic(const Duration(milliseconds: 2500), (step){
      return messages[step];
    }).take(messages.length);
  }


  @override
Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme; // extraemos los estilos

    // centrada
    return  Center(
      child: Column( // la columna
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(), // inidicador circular de progreso
          const SizedBox(height: 80),  // espacio hacia abajo
          // crea el stream
          StreamBuilder(
            stream: getLoadingMessages(), // tomammos los datos del stream de la lista de mensajes
            builder: (context, snapshot){
              if(!snapshot.hasData) return  Text('Cargando...',style: textStyles.titleMedium);

              return Text(snapshot.data! , style: textStyles.titleMedium);
            })
        ]
      )
    );
  }
}