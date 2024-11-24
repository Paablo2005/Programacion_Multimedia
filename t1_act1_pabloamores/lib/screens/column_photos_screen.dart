import 'package:flutter/material.dart';
// Importación de las pantallas necesarias desde 'screens.dart'
import 'package:t1_act1_pabloamores/screens/screens.dart';

// Definición de un widget Stateless llamado ColumnPhotosScreen
class ColumnPhotosScreen extends StatelessWidget {
  const ColumnPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Scaffold(
      // AppBar para mostrar el encabezado de la pantalla
      appBar: AppBar(
        title: const Text('Fotos en Columna'), // Título de la pantalla
      ),
      // Drawer con el menú de navegación
      drawer: const MyDrawer(),
      body: Column(
        // Usamos un Column para apilar los widgets verticalmente
        mainAxisAlignment:
            MainAxisAlignment.center, // Centra los elementos verticalmente
        children: [
          // Primer imagen en la columna, con un tamaño de 100x100
          Image.asset('assets/images/image1.jpg', width: 100, height: 100),
          const SizedBox(height: 10), // Espacio entre imágenes
          // Segunda imagen en la columna
          Image.asset('assets/images/image2.jpg', width: 100, height: 100),
          const SizedBox(height: 10), // Espacio entre imágenes
          // Tercera imagen en la columna
          Image.asset('assets/images/image3.jpg', width: 100, height: 100),
        ],
      ),
    );
  }
}
