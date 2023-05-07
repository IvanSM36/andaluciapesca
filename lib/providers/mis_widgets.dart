import 'package:andaluciapesca/providers/stories_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/stories_model.dart';

// Funcion que diseña el contenedor donde van las Historias
Widget contenedorHistorias() {
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
        return historia(storie);
      }).toList(),
    ),
  );
}

Widget historia(Storie storie) {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 3,
              color: const Color.fromARGB(255, 93, 209, 255),
            )),
        child: Container(
          padding: const EdgeInsets.all(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
              image: NetworkImage(storie.imagen),
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
