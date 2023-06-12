import 'package:cloud_firestore/cloud_firestore.dart';

class Captura {
  // Atributos
  String? titulo;
  String? especie;
  String? urlFoto;
  String? descripcion;

  // Constructor
  Captura({
    this.titulo,
    this.especie,
    this.urlFoto,
    this.descripcion,
  });

  // Metodo que crea una Captura apartir de un DocumentSnapshot que contiene los datos de la BBDD de Firestore
  factory Captura.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return Captura(
      titulo: data?['titulo'],
      especie: data?['especie'],
      urlFoto: data?['urlFoto'],
      descripcion: data?['descripcion'],
    );
  }

  //Metodo para mapear los datos del captura a un formato compatible con Firestore y subirlo a la BBDD
  Map<String, dynamic> toFirestore() {
    return {
      if (titulo != null) "titulo": titulo,
      if (especie != null) "especie": especie,
      if (urlFoto != null) "urlFoto": urlFoto,
      if (descripcion != null) "descripcion": descripcion,
    };
  }
}
