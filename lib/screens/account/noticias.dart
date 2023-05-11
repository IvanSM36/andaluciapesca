import 'package:flutter/material.dart';

class Noticia extends StatelessWidget {
  const Noticia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Noticias'),
        ),
      ),
    );
  }
}
