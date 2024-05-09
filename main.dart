import 'dart:ui' as ui; // Importa el paquete dart:ui
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math'; // Importa la biblioteca dart:math


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Densidades y resolucioness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Oculta el banner de depuración
      home: PixelInfoScreen(),
    );
  }
}

class PixelInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final screenPPI = _calculateScreenPPI(screenSize, ui.window.physicalSize);

    return Scaffold(
      appBar: AppBar(
        title: Text('Densidades y resoluciones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InfoCard(
              title: 'Pixels Independientes de Escala',
              value: screenWidth.toString(),
              color: Colors.blue, // Cambia el color de la tarjeta
            ),
            InfoCard(
              title: 'Pixels',
              value: (screenWidth * pixelRatio).toStringAsFixed(2),
              color: Colors.green, // Cambia el color de la tarjeta
            ),
            InfoCard(
              title: 'Resolución de Pantalla',
              value: '${screenWidth.toInt()} x ${screenHeight.toInt()}',
              color: Colors.orange, // Cambia el color de la tarjeta
            ),
            InfoCard(
              title: 'Píxeles por Pulgada',
              value: screenPPI.toStringAsFixed(2),
              color: Colors.yellow, // Cambia el color de la tarjeta
            ),
          ],
        ),
      ),
    );
  }

double _calculateScreenPPI(Size screenSize, Size physicalSize) {
  final diagonalInches = sqrt(physicalSize.width * physicalSize.width + physicalSize.height * physicalSize.height) / ui.window.devicePixelRatio / 160.0;
  return (screenSize.width / diagonalInches);
}

}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color; // Nuevo atributo para el color de la tarjeta

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.color, // Nuevo parámetro para el color de la tarjeta
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: color, // Utiliza el color proporcionado
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
