import 'package:flutter/material.dart';
// Importación de las pantallas necesarias desde 'screens.dart'
import 'package:t1_act1_pabloamores/screens/screens.dart';

// Definición de un widget Stateless llamado RowPhotosScreen
class RowPhotosScreen extends StatelessWidget {
  const RowPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Scaffold(
      // AppBar para mostrar el encabezado de la pantalla
      appBar: AppBar(
        title: const Text('Fotos en Fila'), // Título de la pantalla
      ),
      // Drawer con el menú de navegación
      drawer: const MyDrawer(),
      // Cuerpo de la pantalla utilizando un Row (fila) para organizar las imágenes horizontalmente
      body: Row(
        mainAxisAlignment: MainAxisAlignment
            .center, // Centra las imágenes horizontalmente en la fila
        children: [
          // Primer imagen de la fila
          Image.asset('assets/images/image1.jpg',
              width: 100, height: 100), // Imagen con tamaño de 100x100
          const SizedBox(width: 10), // Espacio de 10 píxeles entre las imágenes
          // Segunda imagen de la fila
          Image.asset('assets/images/image2.jpg', width: 100, height: 100),
          const SizedBox(width: 10), // Espacio de 10 píxeles entre las imágenes
          // Tercera imagen de la fila
          Image.asset('assets/images/image3.jpg', width: 100, height: 100),
        ],
      ),
    );
  }
}
