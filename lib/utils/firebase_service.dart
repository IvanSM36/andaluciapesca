import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Instancio la base de datos
FirebaseFirestore db = FirebaseFirestore.instance;
// Obtén la instancia de FirebaseAuth
FirebaseAuth auth = FirebaseAuth.instance;
// Obtén el usuario actualmente autenticado
User? user = auth.currentUser;

// Metodo que crea un usuario en la base de datos
Future<void> createUser(String? userName, String name, String? apellido) async {
  await db.collection("usuarios").doc(user?.email).set({
    "email": user?.email,
    "nombreUsuario": userName,
    "apellidos": apellido,
    "nombre": user?.displayName ?? name,
    "telefono": user?.phoneNumber,
    "fotoPerfil": user?.photoURL
  });
}

// Metodo que crea un usuario en la base de datos
Future<void> createUserGoogle() async {
  await db.collection("usuarios").doc(user?.email).set({
    "email": user?.email,
    "nombreUsuario": null,
    "apellidos": null,
    "nombre": user?.displayName,
    "telefono": user?.phoneNumber,
    "fotoPerfil": user?.photoURL
  });
}

// Metodo que crea un usuario en la base de datos
Future<void> getUser() async {
  await db.collection("usuarios").doc(user?.email).get().then((nombre) => null);
}

Future<void> getUser2() async {
  var documentSnapshot = await db.collection("usuarios").doc(user?.email).get();
  if (documentSnapshot.exists) {
    var email = documentSnapshot.data()!["email"];
    var nombreUsuario = documentSnapshot.data()!["nombreUsuario"];
    var nombre = documentSnapshot.data()!["nombre"];
    var fotoPerfil = documentSnapshot.data()!["fotoPerfil"];
    var telefono = documentSnapshot.data()!["telefono"];
  }
}

UserInfo? readUser() {
  if (user != null) {
    for (final providerProfile in user!.providerData) {
      final provider = providerProfile.providerId;
      return providerProfile;

      // // UID specific to the provider
      // final uid = providerProfile.uid;

      // // Name, email address, and profile photo URL
      // final name = providerProfile.displayName;
      // final emailAddress = providerProfile.email;
      // final profilePhoto = providerProfile.photoURL;
    }
  }
}



// Metodo que consulta los datos del usuario de la base de datos
// Future readUsers2() async {
//   await FirebaseFirestore.instance
//       .collection("usuarios")
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .get()
//       .then((snapshot) {
//     if (snapshot.exists) {
//       setState(() {
//         var nombreUsuario = snapshot.data()!["nombreUsuario"];
//         var nombre = snapshot.data()!["nombre"];
//         var apellidos = snapshot.data()!["apellidos"];
//         var fotoPerfil=  snapshot.data()!["fotoPerfil"];
//       });
//     }
//   });
// }

