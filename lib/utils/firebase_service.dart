import 'package:andaluciapesca/providers/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Instancio la base de datos
FirebaseFirestore db = FirebaseFirestore.instance;
// Obtén la instancia de FirebaseAuth
FirebaseAuth auth = FirebaseAuth.instance;
// Obtén el usuario actualmente autenticado
User? user = auth.currentUser;

// Metodo para añadir los datos de una cuenta Google a la base de datos
Future<void> createUserGoogle() async {
  await db.collection("usuarios").doc(user?.email).set({
    "email": user?.email,
    "nombreUsuario": "",
    "apellidos": "",
    "nombre": user?.displayName,
    "telefono": user?.phoneNumber ?? "",
    "fotoPerfil": user?.photoURL
  });
}

// Metodo para añadir los datos del usuario a la base de datos
Future<void> agregarDatosUsuario(String email, String nombreUsuario,
    String nombre, String apellidos, String telefono, String fotoPerfil) async {
  final Usuario usuario = Usuario(
      email: email,
      nombreUsuario: nombreUsuario,
      nombre: nombre,
      apellidos: apellidos,
      fotoPerfil: fotoPerfil,
      telefono: telefono);

  await FirebaseFirestore.instance
      .collection("usuarios")
      .doc(usuario.email)
      .set(usuario.toFirestore());
}

// Metodo para obtener los datos de un usuario
Future<Usuario> getUsuario() async {
  final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await db.collection('usuarios').doc(user?.email).get();

  final Usuario usuario = Usuario.fromFirestore(snapshot, null);

  return usuario;
}
