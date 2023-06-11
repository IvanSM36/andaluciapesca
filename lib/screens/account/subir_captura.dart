import 'dart:io';

import 'package:andaluciapesca/utils/seleccionarImagen.dart';
import 'package:andaluciapesca/services/subirImagen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SubirCaptura extends StatefulWidget {
  const SubirCaptura({super.key});

  @override
  State<SubirCaptura> createState() => _SubirCapturaState();
}

class _SubirCapturaState extends State<SubirCaptura> {
  File? subirImagenFirebase;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 61, 75, 59),
          elevation: 5,
          centerTitle: true,
          title: const Text('Subir captura'),
        ),
        body: Column(
          children: [
            //Compruebo si existe una imagen  muestro la imagen, si no solo el cuadro
            subirImagenFirebase != null
                ? Image.file(subirImagenFirebase!)
                : Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
            ElevatedButton(
              onPressed: () async {
                // Obtenemos la imagen con el metodo getImage
                final XFile? imagen = await getImage();

                //
                setState(() {
                  subirImagenFirebase = File(imagen!.path);
                });
              },
              child: const Text('Seleccionar imagen'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Compruebo, si la variable tiene una imagen la subo, si no tiene no hace nada
                if (subirImagenFirebase != null) {
                  final uploaded = await subirImagen(subirImagenFirebase!);

                  //Como retorna un booleano podemos mostrar un mensaje si se ha subido correctamente o no
                  if (uploaded) {
                    Fluttertoast.showToast(
                        msg: "Se ha subido la imagen correctamente.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor:
                            const Color.fromARGB(255, 108, 173, 70),
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "No se ha podido subir la imagen",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                } else {
                  return; //No hace nada
                }
              },
              child: const Text('Subir imagen'),
            ),
          ],
        ),
      ),
    );
  }
}
