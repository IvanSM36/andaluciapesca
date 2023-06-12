import 'package:cloud_firestore/cloud_firestore.dart';

class Zona {
  // Atributos
  String? titulo;
  String? provincia;
  String? ciudad;
  String? latitud;
  String? longitud;
  String? estacion;
  String? descripcion;

  // Constructor
  Zona({
    this.titulo,
    this.provincia,
    this.ciudad,
    this.latitud,
    this.longitud,
    this.estacion,
    this.descripcion,
  });

  // Metodo que crea una Captura apartir de un DocumentSnapshot que contiene los datos de la BBDD de Firestore
  factory Zona.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return Zona(
      titulo: data?['titulo'],
      provincia: data?['provincia'],
      ciudad: data?['ciudad'],
      latitud: data?['latitud'],
      longitud: data?['longitud'],
      estacion: data?['estacion'],
      descripcion: data?['descripcion'],
    );
  }

  //Metodo para mapear los datos del captura a un formato compatible con Firestore y subirlo a la BBDD
  Map<String, dynamic> toFirestore() {
    return {
      if (titulo != null) "titulo": titulo,
      if (provincia != null) "provincia": provincia,
      if (ciudad != null) "ciudad": ciudad,
      if (latitud != null) "latitud": latitud,
      if (longitud != null) "longitud": longitud,
      if (estacion != null) "estacion": estacion,
      if (descripcion != null) "descripcion": descripcion,
    };
  }
}
