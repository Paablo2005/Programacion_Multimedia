import 'package:flutter/material.dart';
// Importación de las pantallas necesarias desde 'screens.dart'
import 'package:t1_act1_pabloamores/screens/screens.dart';

// Definición de un widget Stateless llamado NestedRowsAndColumnsScreen
class NestedRowsAndColumnsScreen extends StatelessWidget {
  const NestedRowsAndColumnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Scaffold(
      // AppBar para mostrar el encabezado de la pantalla
      appBar: AppBar(
        title: const Text(
            'Ejemplo de filas y columnas anidadas'), // Título de la pantalla
      ),
      // Drawer con el menú de navegación
      drawer: const MyDrawer(),
      // Cuerpo de la pantalla, utilizando una columna principal para organizar los elementos
      body: const Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centra la columna verticalmente
        crossAxisAlignment: CrossAxisAlignment
            .center, // Centra los elementos horizontalmente dentro de la columna
        children: [
          // Primer Row (fila), que contiene una sola columna
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra la fila horizontalmente
            children: [
              // Columna con un ícono y texto
              Column(
                children: [
                  Icon(Icons.phone,
                      size: 50), // Ícono de teléfono con tamaño 50
                  SizedBox(
                      height: 10), // Espacio de 10 píxeles debajo del ícono
                  Text('Llamar por teléfono'), // Texto debajo del ícono
                ],
              ),
            ],
          ),
          SizedBox(height: 20), // Espacio de 20 píxeles entre las filas
          // Segunda Row (fila), que contiene dos columnas
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra la fila horizontalmente
            children: [
              // Primera columna con un ícono y texto
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20), // Espacio de 20 píxeles entre las columnas
              // Segunda columna con un ícono y texto
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20), // Espacio de 20 píxeles entre las filas
          // Tercera Row (fila), que contiene tres columnas
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra la fila horizontalmente
            children: [
              // Primera columna con un ícono y texto
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20), // Espacio de 20 píxeles entre las columnas
              // Segunda columna con un ícono y texto
              Column(
                children: [
                  Icon(Icons.phone, size: 50),
                  SizedBox(height: 10),
                  Text('Llamar por teléfono'),
                ],
              ),
              SizedBox(width: 20), // Espacio de 20 píxeles entre las columnas
              // Tercera columna con un ícono y texto
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
