// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  // Atributos
  String email;
  String nombreUsuario;
  String nombre;
  String apellidos;
  String fotoPerfil;
  String telefono;

  // Constructor
  Usuario({
    required this.email,
    required this.nombreUsuario,
    required this.nombre,
    required this.apellidos,
    required this.fotoPerfil,
    required this.telefono,
  });

  // Metodo que crea un Usuario apartir de un DocumentSnapshot que contiene los datos de la base de datos
  factory Usuario.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Usuario(
      email: data?['email'],
      nombreUsuario: data?['nombreUsuario'],
      nombre: data?['nombre'],
      apellidos: data?['apellidos'],
      fotoPerfil: data?['fotoPerfil'],
      telefono: data?['telefono'],
    );
  }

  //Metodo para mapear los datos del usuario
  Map<String, dynamic> toFirestore() {
    return {
      if (email != null) "email": email,
      if (nombreUsuario != null) "nombreUsuario": nombreUsuario,
      if (nombre != null) "nombre": nombre,
      if (apellidos != null) "apellidos": apellidos,
      if (fotoPerfil != null) "fotoPerfil": fotoPerfil,
      if (telefono != null) "telefono": telefono,
    };
  }
}
