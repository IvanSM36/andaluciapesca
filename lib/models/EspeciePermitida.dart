// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class EspeciePermitida {
  // Atributos
  String? especie;
  String? urlFoto;
  String? descripcion;

  // Constructor
  EspeciePermitida({
    this.especie,
    this.urlFoto,
    this.descripcion,
  });

  // Metodo que crea una Captura apartir de un DocumentSnapshot que contiene los datos de la BBDD de Firestore
  factory EspeciePermitida.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return EspeciePermitida(
      especie: data?['especie'],
      urlFoto: data?['urlFoto'],
      descripcion: data?['descripcion'],
    );
  }

  //Metodo para mapear los datos del captura a un formato compatible con Firestore y subirlo a la BBDD
  Map<String, dynamic> toFirestore() {
    return {
      if (especie != null) "especie": especie,
      if (urlFoto != null) "urlFoto": urlFoto,
      if (descripcion != null) "descripcion": descripcion,
    };
  }
}
