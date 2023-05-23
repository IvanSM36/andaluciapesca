import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SubirCaptura extends StatelessWidget {
  const SubirCaptura({super.key});

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
            ElevatedButton(
              onPressed: () async {
                // aquí puedes mostrar la imagen seleccionada en un widget
              },
              child: Text('Seleccionar imagen'),
            ),
          ],
        ),
      ),
    );
  }
}
