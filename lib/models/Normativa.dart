import 'package:cloud_firestore/cloud_firestore.dart';

class Normativa {
  // Atributos
  String? titulo;
  String? fecha;
  String? urlFoto;
  String? descripcion;

  // Constructor
  Normativa({
    this.titulo,
    this.fecha,
    this.urlFoto,
    this.descripcion,
  });

  // Metodo que crea una Captura apartir de un DocumentSnapshot que contiene los datos de la BBDD de Firestore
  factory Normativa.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return Normativa(
      titulo: data?['titulo'],
      fecha: data?['fecha'],
      urlFoto: data?['urlFoto'],
      descripcion: data?['descripcion'],
    );
  }

  //Metodo para mapear los datos del captura a un formato compatible con Firestore y subirlo a la BBDD
  Map<String, dynamic> toFirestore() {
    return {
      if (titulo != null) "titulo": titulo,
      if (fecha != null) "fecha": fecha,
      if (urlFoto != null) "urlFoto": urlFoto,
      if (descripcion != null) "descripcion": descripcion,
    };
  }
}
