import 'package:flutter/material.dart';

class ZonasPermitidas extends StatelessWidget {
  const ZonasPermitidas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Zonas Permitidas'),
        ),
      ),
    );
  }
}
