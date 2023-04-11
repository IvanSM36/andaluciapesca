import 'package:andaluciapesca/src/providers/stories_provider.dart';
import 'package:flutter/material.dart';

import 'models/stories_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Instanciamos objeto
  StoriesProvider storiesProvider = new StoriesProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andalucia app',
      debugShowCheckedModeBanner: false, // Oculta la etiqueta Debug del Appbar
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 61, 75, 59),
          elevation: 5,
          centerTitle: true,
          title: const Text('Andalucia pesca'),
        ),
        body: _contenedorHistorias(),
      ),
    );
  }
}

// Funcion que diseña el contenedor donde van las Historias
Widget _contenedorHistorias() {
  StoriesProvider storiesProvider = StoriesProvider();
  return Container(
    height: 105,
    width: double.infinity, // Ocupa el 100% de la pantalla a lo ancho
    margin: const EdgeInsets.only(
        top: 10, left: 5), // Le damos un margin a las historias
    child: ListView(
      scrollDirection: Axis.horizontal, // Hace la lista y el scroll Horizontal
      shrinkWrap: true, // Se adapta al contenido
      children: storiesProvider.getStories().map((storie) {
        return _historia(storie);
      }).toList(),
    ),
  );
}

Widget _historia(Storie storie) {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 3,
              color: const Color.fromARGB(255, 9, 112, 16),
            )),
        child: Container(
          padding: const EdgeInsets.all(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
              image: NetworkImage(
              storie.imagen),
              height: 65,
              width: 65,
              fit: BoxFit.cover, // Se ajuste al contenedor
            ),
          ),
        ),
      ),
       Text(
        storie.nombre,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}
