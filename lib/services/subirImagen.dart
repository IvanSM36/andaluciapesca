import 'dart:io';

import 'package:andaluciapesca/utils/firebase_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> subirImagen(File image) async {
  // El path muestra la ruta del archivo, por lo que vamos a separar mediante / para quedarnos que el nombre del archivo.
  final String nameFile = image.path.split("/").last;

  // Subimos la imagen al Storage de firebase
  // Referencia de la direccion donde vamos a subir nuestra imagen (Crearia carpetas en el Storage)
  final Reference ref = storage.ref().child("capturas").child(nameFile);

  // Subimos el archivo a la referencia
  final UploadTask uploadTask = ref.putFile(image);

  // Monitoriza la subida y devuelve true si se ha subido
  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);

  // Obtengo el enlace url de la imagen
  final String url = await snapshot.ref.getDownloadURL();

  // Compruebo si snapshot terminó correctamnte retorno true si no false
  if (snapshot.state == TaskState.success) {
    FirebaseService().setImageInGallery(url);

    return true;
  } else {
    return false;
  }
}
