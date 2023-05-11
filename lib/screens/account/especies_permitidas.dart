import 'package:flutter/material.dart';

class EspeciesPermitidas extends StatelessWidget {
  const EspeciesPermitidas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Especies Permitidas'),
        ),
      ),
    );
  }
}
