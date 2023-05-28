import 'package:image_picker/image_picker.dart';

Future<XFile?> getImage() async {
  final ImagePicker picker = ImagePicker();

  // Lanza nuestra galeria y guarda la imagen en la variable.
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image;
}
