import 'package:cloud_firestore/cloud_firestore.dart';

class ZonaPermitida {
  // Atributos
  String? nombreZona;
  String? provincia;
  String? ciudad;
  String? fecha;
  String? urlFoto;
  String? descripcion;

  // Constructor
  ZonaPermitida({
    this.nombreZona,
    this.provincia,
    this.ciudad,
    this.fecha,
    this.urlFoto,
    this.descripcion,
  });

  // Metodo que crea una Captura apartir de un DocumentSnapshot que contiene los datos de la BBDD de Firestore
  factory ZonaPermitida.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return ZonaPermitida(
      nombreZona: data?['nombreZona'],
      provincia: data?['provincia'],
      ciudad: data?['ciudad'],
      fecha: data?['fecha'],
      urlFoto: data?['urlFoto'],
      descripcion: data?['descripcion'],
    );
  }

  //Metodo para mapear los datos del captura a un formato compatible con Firestore y subirlo a la BBDD
  Map<String, dynamic> toFirestore() {
    return {
      if (nombreZona != null) "nombreZona": nombreZona,
      if (provincia != null) "provincia": provincia,
      if (ciudad != null) "ciudad": ciudad,
      if (fecha != null) "fecha": fecha,
      if (urlFoto != null) "urlFoto": urlFoto,
      if (descripcion != null) "descripcion": descripcion,
    };
  }
}
