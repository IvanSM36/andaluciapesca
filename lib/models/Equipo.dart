import 'package:cloud_firestore/cloud_firestore.dart';

class Equipo {
  // Atributos
  String? titulo;
  String? cania;
  String? carrete;
  String? linea;
  String? boya;
  String? anzuelo;
  String? senuelo;
  String? cebo;

  // Constructor
  Equipo({
    this.titulo,
    this.cania,
    this.carrete,
    this.linea,
    this.boya,
    this.anzuelo,
    this.senuelo,
    this.cebo,
  });

  // Metodo que crea una Captura apartir de un DocumentSnapshot que contiene los datos de la BBDD de Firestore
  factory Equipo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return Equipo(
      titulo: data?['titulo'],
      cania: data?['cania'],
      carrete: data?['carrete'],
      linea: data?['linea'],
      boya: data?['descripcion'],
      anzuelo: data?['anzuelo'],
      senuelo: data?['senuelo'],
      cebo: data?['cebo'],
    );
  }

  //Metodo para mapear los datos del captura a un formato compatible con Firestore y subirlo a la BBDD
  Map<String, dynamic> toFirestore() {
    return {
      if (titulo != null) "titulo": titulo,
      if (cania != null) "cania": cania,
      if (carrete != null) "carrete": carrete,
      if (linea != null) "linea": linea,
      if (boya != null) "boya": boya,
      if (anzuelo != null) "anzuelo": anzuelo,
      if (senuelo != null) "senuelo": senuelo,
      if (cebo != null) "cebo": cebo,
    };
  }
}
