// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  // Atributos
  String? email;
  String? nombreUsuario;
  String? nombre;
  String? apellidos;
  String? fotoPerfil;
  String? telefono;
  String? urlImagen;
  List? galeria;

  // Constructor
  Usuario(
      {this.email,
      this.nombreUsuario,
      this.nombre,
      this.apellidos,
      this.fotoPerfil,
      this.telefono,
      this.urlImagen,
      this.galeria});

  // Metodo que crea un Usuario apartir de un DocumentSnapshot que contiene los datos de la BBDD de Firestore
  factory Usuario.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return Usuario(
      email: data?['email'],
      nombreUsuario: data?['nombreUsuario'],
      nombre: data?['nombre'],
      apellidos: data?['apellidos'],
      fotoPerfil: data?['fotoPerfil'],
      telefono: data?['telefono'],
      urlImagen: data?['urlImagen'],
      galeria: data?['galeria'],
    );
  }

  //Metodo para mapear los datos del usuario a un formato compatible con Firestore y subirlo a la BBDD
  Map<String, dynamic> toFirestore() {
    return {
      if (email != null) "email": email,
      if (nombreUsuario != null) "nombreUsuario": nombreUsuario,
      if (nombre != null) "nombre": nombre,
      if (apellidos != null) "apellidos": apellidos,
      if (fotoPerfil != null) "fotoPerfil": fotoPerfil,
      if (telefono != null) "telefono": telefono,
      if (urlImagen != null) "urlImagen": urlImagen,
      if (galeria != null) "galeria": galeria,
    };
  }
}
