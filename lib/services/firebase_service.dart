// ignore_for_file: camel_case_types

import 'package:andaluciapesca/models/Captura.dart';
import 'package:andaluciapesca/models/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Instancio la base de datos
FirebaseFirestore db = FirebaseFirestore.instance;
// Obtén la instancia de FirebaseAuth
FirebaseAuth auth = FirebaseAuth.instance;
// Obtén el usuario actualmente autenticado
User? user = auth.currentUser;

class FirebaseService {
// Metodo para añadir los datos de una cuenta Google a la base de datos
  Future<void> setUserDataGoogle() async {
    await db.collection("usuarios").doc(user?.email).set({
      "email": user?.email,
      "nombreUsuario":
          null ?? user?.displayName, // Si es null muestre el nombre.
      "apellidos": "",
      "nombre": user?.displayName,
      "telefono": user?.phoneNumber ?? "",
      "fotoPerfil": user?.photoURL
    });
  }

// Metodo para añadir los datos del usuario a la base de datos
  Future<void> setUsuarioData(
    String email,
    String nombreUsuario,
    String nombre,
    String apellidos,
    String telefono,
    String fotoPerfil,
  ) async {
    final Usuario usuario = Usuario(
      email: email,
      nombreUsuario: nombreUsuario,
      nombre: nombre,
      apellidos: apellidos,
      fotoPerfil: fotoPerfil,
      telefono: telefono,
    );

    await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(usuario.email)
        .set(usuario.toFirestore());
  }

  // Metodo que crea un documento de la coleccion Captura que se encuentra dentro del documento Usuario de la coleccion Usuarios
  // Future<void> setCaptura(
  //     String titulo, String especie, String urlFoto, String descripcion) async {
  //   final Captura captura =
  //       Captura(especie: especie, urlFoto: urlFoto, descripcion: descripcion);

  //   await FirebaseFirestore.instance
  //       .collection("usuarios")
  //       .doc(user.email)
  //       .collection("capturas")
  //       .doc(titulo)
  //       .set(captura.toFirestore());
  // }

  // Metodo para añadir el url de la imagen a la base de datos del usuario
  /*Future<void> setImageInCapturas(
      String urlFoto, String titulo, String especie, String descripcion) async {
    // Obtengo el usuario
    final DocumentSnapshot<Map<String, dynamic>> snapshotUsuario =
        await db.collection('usuarios').doc(user?.email).get();
    final Usuario usuario = Usuario.fromFirestore(snapshotUsuario, null);

    final DocumentSnapshot<Map<String, dynamic>> snapshotCaptura =
        await db.collection('capturas').doc(user?.email).get();

    final Captura captura = Captura.fromFirestore(snapshotCaptura, null);

    // Obtén una instancia de la colección de usuarios en Firestore
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('usuarios');

// Obtén el documento del usuario existente
    final DocumentReference userDocRef = usersCollection
        .doc(usuario.email)
        .collection("capturas")
        .doc(captura.titulo);

    CollectionReference capturasRef = userDocRef.collection('capturas');
    DocumentReference nuevoDocumentoRef = await capturasRef.add(urlFoto);
  }*/

// Metodo para añadir el url de la imagen a la base de datos del usuario
  Future<void> setImageInCapturas(String url) async {
    // Obtengo el usuario
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection('usuarios').doc(user?.email).get();
    final Usuario usuario = Usuario.fromFirestore(snapshot, null);

    // Obtén una instancia de la colección de usuarios en Firestore
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('usuarios');

// Obtén el documento del usuario existente
    final DocumentReference userDocRef = usersCollection.doc(usuario.email);

// Define el nuevo campo de Array de Strings de URLs
    final List<String> urls = [url];

// Actualiza el documento del usuario añadiendo el campo de URLs
    userDocRef.update({'galeria': FieldValue.arrayUnion(urls)}).then((_) {
      print('Campo de URLs añadido correctamente.');
    }).catchError((error) {
      print('Error al añadir el campo de URLs: $error');
    });
  }
}
