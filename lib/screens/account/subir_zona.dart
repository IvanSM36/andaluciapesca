import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

const positionMap = LatLng(37.376796, -5.986858);

class SubirZona extends StatefulWidget {
  const SubirZona({super.key});
  @override
  State<SubirZona> createState() => _SubirZonaState();
}

class _SubirZonaState extends State<SubirZona> {
  late MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subir zona',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Subir zona'),
        ),
        body: MapboxMap(
          accessToken:
              'sk.eyJ1IjoiaXZhbnNtMjAiLCJhIjoiY2xpOGh5aDUxMWNraTNla2J3Z3lhMDQzdCJ9.ocMmh6nrCoW_isWMjheENw',
          styleString: 'mapbox://styles/ivansm20/cli67fq6r02k801r000n8daa8',
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: positionMap,
            zoom: 5,
          ),
        ),

        // FlutterMap(
        //   options: MapOptions(
        //       center: positionMap, zoom: 13.0, minZoom: 2, maxZoom: 25),
        //   nonRotatedChildren: [
        //     TileLayer(
        //       urlTemplate:
        //           'https://api.mapbox.com/styles/v1/ivansm20/cli67fq6r02k801r000n8daa8.html?title=true&access_token=pk.eyJ1IjoiaXZhbnNtMjAiLCJhIjoiY2xpNjZoYjRlMHdwazNmcGN5dXZpaDBncSJ9.UL-6MsW72UA_lqPXhIzJ-Q#6.8/38.152179/-3.934219/0',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
