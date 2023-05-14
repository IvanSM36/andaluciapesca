import 'package:cloud_firestore/cloud_firestore.dart';

// Instancio la base de datos
FirebaseFirestore db = FirebaseFirestore.instance;

// Metodo que consulta los datos del usuario
Future<List> readUsers() async {
  List user = [];
  QuerySnapshot querySnapshot = await db.collection('user').get();
  for (var doc in querySnapshot.docs) {
    user.add(doc.data());
  }
  return user;
}

Future<void> createUser(String userName, String name, String apellido) async {
  await db
      .collection('usuarios')
      .add({"userName": userName, "name": name, "apellido": apellido});
}
