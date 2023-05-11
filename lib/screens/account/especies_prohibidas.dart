import 'package:flutter/material.dart';

class EspeciesProhibidas extends StatelessWidget {
  const EspeciesProhibidas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Especies Prohibidas'),
        ),
      ),
    );
  }
}
