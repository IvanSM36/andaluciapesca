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

























  // // Getters and Setters
  // String get getEmail {
  //   return email;
  // }

  // set setEmail(String valor) {
  //   email = valor;
  // }

  // String get getNombreUsuario {
  //   return nombreUsuario;
  // }

  // set setNombreUsuario(String valor) {
  //   nombreUsuario = valor;
  // }

  // String get getNombre {
  //   return nombre;
  // }

  // set setNombre(String valor) {
  //   nombre = valor;
  // }

  // String get getApellidos {
  //   return apellidos;
  // }

  // set setApellidos(String valor) {
  //   apellidos = valor;
  // }

  // String get getFotoPerfil {
  //   return fotoPerfil;
  // }

  // set setFotoPerfil(String valor) {
  //   fotoPerfil = valor;
  // }

