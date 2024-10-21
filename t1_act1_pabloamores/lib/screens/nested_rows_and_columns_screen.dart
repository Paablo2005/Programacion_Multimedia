import 'package:flutter/material.dart';

class NestedRowsAndColumnsScreen extends StatelessWidget {
  const NestedRowsAndColumnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de filas y columnas anidadas'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Primera fila con un solo elemento centrado
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          // Segunda fila con dos elementos
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          // Tercera fila con tres elementos
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
