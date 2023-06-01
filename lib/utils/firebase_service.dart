// ignore_for_file: camel_case_types

import 'package:andaluciapesca/providers/Usuario.dart';
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
  Future<void> setUserData(
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

// Metodo para añade el url de la imagen a la base de datos del usuario
  Future<void> setImageInGallery(String url) async {
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
