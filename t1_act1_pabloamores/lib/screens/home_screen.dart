import 'package:flutter/material.dart';
// Importación de las pantallas necesarias desde 'screens.dart'
import 'package:t1_act1_pabloamores/screens/screens.dart';

// Definición de un widget Stateless llamado HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método build que construye la UI del widget
    return Scaffold(
      // AppBar para mostrar el encabezado de la pantalla
      appBar: AppBar(
        title: const Text('Drawer Navigation App'), // Título de la pantalla
      ),
      // Drawer con el menú de navegación
      drawer: const MyDrawer(),
      // Cuerpo de la pantalla
      body: const Center(
        // Centra el texto en la pantalla
        child: Text(
            'Selecciona una opción en el Drawer'), // Texto que instruye al usuario a seleccionar una opción
      ),
    );
  }
}
