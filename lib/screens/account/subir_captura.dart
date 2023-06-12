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

  final tituloController = TextEditingController();
  final especieController = TextEditingController();
  final urlFotoController = TextEditingController();
  final descripcionController = TextEditingController();

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
        body: ListView(
          children: [
            Column(
              children: [
                //Compruebo si existe una imagen, muestro la imagen, si no, muestro un cuadro vacio
                subirImagenFirebase != null
                    ? SizedBox(
                        width: MediaQuery.of(context)
                            .size
                            .width, // para que coja el ancho de la pantalla
                        height: 300,
                        child: Image.file(
                          subirImagenFirebase!,
                          fit: BoxFit
                              .cover, //Para que la imagen se adapte al Sizebox
                        ))
                    : Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),

                //////////  BOTON SELECCIONAR IMAGEN /////////
                ElevatedButton(
                  onPressed: () async {
                    // Obtenemos la imagen con el metodo getImage
                    final XFile? imagen = await getImage();

                    setState(() {
                      subirImagenFirebase = File(imagen!.path);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(200, 61, 75, 59),
                      // Tamaño mínimo del botón
                      minimumSize: const Size(0, 45),
                      shape: RoundedRectangleBorder(
                        // Hacer los bordes más redondos con un radio de 20 píxeles
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(300, 45)),
                  child: const Text('Seleccionar imagen'),
                ),

                Container(
                  margin: const EdgeInsets.all(30.0),
                  child: Form(
                    child: Column(
                      children: [
                        ///// Campo  Titulo/////
                        TextFormField(
                          controller: tituloController,
                          cursorColor: const Color.fromARGB(199, 141, 179, 136),
                          style: const TextStyle(
                            // Color del texto cuando escribimos
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(109, 0, 0, 0),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            labelText: 'Titulo:',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        ///// Campo Especie /////
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: especieController,
                            cursorColor:
                                const Color.fromARGB(199, 141, 179, 136),
                            style: const TextStyle(
                              // Color del texto cuando escribimos
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              fillColor: Color.fromARGB(109, 0, 0, 0),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              labelText: 'Especie:',
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        ///// Campo Descripcion /////
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            maxLines: 5,
                            controller: descripcionController,
                            cursorColor:
                                const Color.fromARGB(199, 141, 179, 136),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              fillColor: Color.fromARGB(109, 0, 0, 0),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              labelText: 'Descripción',
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        ////////// BOTON SUBIR IMAGEN //////////
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Creo el documento en capturas
                              // Compruebo, si la variable tiene una imagen la subo, si no tiene no hace nada
                              if (subirImagenFirebase != null) {
                                final uploaded =
                                    await subirImagen(subirImagenFirebase!);

                                //Como retorna un booleano podemos mostrar un mensaje si se ha subido correctamente o no
                                if (uploaded) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Se ha subido la imagen correctamente.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 5,
                                      backgroundColor: const Color.fromARGB(
                                          255, 108, 173, 70),
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
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(200, 61, 75, 59),
                                // Tamaño mínimo del botón
                                minimumSize: const Size(0, 45),
                                shape: RoundedRectangleBorder(
                                  // Hacer los bordes más redondos con un radio de 20 píxeles
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                fixedSize: const Size(300, 45)),
                            child: const Text('Subir imagen'),
                          ),
                        ),
                        //////////////////////////////////////
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
